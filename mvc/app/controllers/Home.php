<?php
use Illuminate\Http\Request as Request;

use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Api\Payer;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Details;
use PayPal\Api\Amount;
use PayPal\Api\Transaction;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;
use PayPal\Api\PaymentExecution;

define('SITE_URL', 'http://localhost:80/pattywhack/mvc/public/home');




class Home extends Controller{
	public $paypal;

	public function __construct(){
		 $this->paypal = new \PayPal\Rest\ApiContext(
			new \PayPal\Auth\OAuthTokenCredential(
				'ARxUXJHH5K43BUp-u39mPXfW-mfAxahfbSkEyPMzLVXDDkhoIFiNtL7ET4WMvx0ly4e8jVm-MP5fXusP',
				'EGd8S6WcqLROCZc-UOYAdsxbD0V1Ncyz-0QwEtNIn-8ZPVFCLCc8TMBud_9BAiKTGU9OrUDIUsF_onm0'
				 )
			);
	}


	public function payment(){
		
		if(!empty($_SESSION['order_id'])){

			

			$order = $this->model('Orders')->where('order_id', $_SESSION['order_id'])->first();

			$product = 'Your Patty Whack Surprise!';
			$price = $order->total;
			$shipping = $order->shipping_cost;
			
			$tax = $price * 0.15;
			$total = $price + $shipping + $tax;
			$payer = new Payer();
			$payer->setPaymentMethod('paypal');


			$item = new Item();
			$item->setName($product)
				->setCurrency('CAD')
				->setQuantity(1)
				->setPrice($price);

			$itemList = new ItemList();
			$itemList->setItems([$item]);


			$details = new Details();
			$details->setShipping($shipping)
				->setTax($tax)
				->setSubtotal($price);

			$amount = new Amount();
			$amount->setCurrency('CAD')
				   ->setTotal($total)
				   ->setDetails($details);

			$transaction = new Transaction();
			$transaction->setAmount($amount)
						->setItemList($itemList)
					    ->setDescription('Patty Whack Bill')
					    ->setInvoiceNumber(uniqid());

			$redirectUrls = new RedirectUrls();
//			$redirectUrls->setReturnUrl(SITE_URL . '/pay?approved=true')
//						->setCancelUrl(SITE_URL .  '/pay?approved=false');
//http://192.168.56.1/pattywhack/mvc/public/home/pay.php?approved=true&paymentId=PAY-695130643V217064CLA2ZY4Y&token=EC-5PR4699574723245V&PayerID=6B8FWKHKAXQDG
			$redirectUrls->setReturnUrl(SITE_URL . '/processPayment?success=true')
						 ->setCancelUrl(SITE_URL . '/processPayment?success=false');




			$payment = new Payment();
			$payment->setIntent('sale')
					->setPayer($payer)
					->setRedirectUrls($redirectUrls)
					->setTransactions([$transaction]);

				try{
					$payment->create($this->paypal);
				}catch(Exception $e){
					
				}

			$approvalUrl = $payment->getApprovalLink();
			header("Location: {$approvalUrl}");

			// Need to finish execute payment
			//https://youtu.be/BD1dOWIABe0?t=1813
		}
		


	}



	


	public function index($name = ''){
		/*$user = $this->model('User');
		$user->$name = $name;*/
		$this->view('home/index');//, ['name' => $user->$name]);
	}

	public function register($name = ''){
		/*$user = $this->model('User');
		$user->$name = $name;*/
		$this->view('home/register');//, ['name' => $user->$name]);
	}

    public function terms($name = ''){
		/*$user = $this->model('User');
		$user->$name = $name;*/
		$this->view('home/terms');//, ['name' => $user->$name]);
	}
    
        public function login($name = ''){
		/*$user = $this->model('User');
		$user->$name = $name;*/
		$this->view('home/login');//, ['name' => $user->$name]);
	}
    
    public function placeOrder(){
		$this->view('home/placeOrder');
	}
    
    public function shipping(){
        
        $_SESSION['budget'] = $_POST['budgetBox'];
        $_SESSION['MPPI']  = $_POST['points'];
        $getUserByUsername = $this->model('user');
        $user = $getUserByUsername->where('username' , $_SESSION["user"])->first();
       

        if(!empty($user)) 
        	$this->view('home/shipping',['email'=>$user->email,'address'=>"$user->address",'postalCode'=>"$user->postal_code"]);



        $this->view('home/shipping');
        
	}
    
    public function setTracking() 
    {
        
        $id = $_POST['orderID'];
        $setTrack = $this->model('orders')->where('order_id', $id)->first();
        $setTrack->tracking_number = $_POST['track'];
        $setTrack->save();
        
        header("Location: http://localhost/pattywhack/mvc/public/home/shippingWorker");
        
    }
    
    public function setShipped($id)
    {
        $setShip = $this->model('orders')->where('order_id', $id)->first();
        $setShip->status_id = 8;
        $setShip->save();
        header("Location: http://localhost/pattywhack/mvc/public/home/shippingWorker");
    }
    
    public function setComplete($id)
    {
        $setComp = $this->model('orders')->where('order_id', $id)->first();
        $setComp->status_id = 2;
        $setComp->save();
        header("Location: http://localhost/pattywhack/mvc/public/home/shippingWorker");
    }

    public function confirmOrder(){
    	if($this->checkAnonymous()){

    	}
    	$product = $this->prepareOrder();

    	 $order = $this->model('Orders')->where('order_id', $_SESSION['order_id'])->first();

			$price = $order->total;
			$shipping = $order->shipping_cost;
			
			$tax = round($price * 0.15, 2);
			$total = $price + $shipping + $tax;

		$this->view('home/confirmOrder', ['price' => $price , 'shipping' => $shipping, 'total' => $total]);
	}
    

	private function checkAnonymous(){
		if(!isset($_SESSION['user'])){
				$user = $this->model('user')->where('email', $_POST['email'])->get();
				if($user->count() == 0){ //0 or empty password
					$newguy = new User;
					$newguy->username = $_POST['email'];
					$newguy->address = $_POST["ShipAddr"];
					$newguy->password_hash = '';
					$newguy->postal_code = $_POST["postalCode"];
					$newguy->email = $_POST['email'];
					$newguy->authority_id = 3;
					$newguy->save();

					$_SESSION['user'] = $_POST['email'];
				}else if($user->first()->password_hash == ''){ //0 or empty password
					
					$user->first()->address = $_POST["ShipAddr"];					
					$user->first()->postal_code = $_POST["postalCode"];
					$user->first()->email = $_POST['email'];
					$user->first()->save();

					$_SESSION['user'] = $_POST['email'];
				}
				else{
					$this->view('home/placeOrder', ['message' => "That email is currently assign to a member. Please log in."]);
				    die();
				}
		}
	}



    public function insertOrder(){
        header("Location: http://localhost/pattywhack/mvc/public/home");	
		$this->view('home/index');
	}
    
    public function processPayment(){
			if(!empty($_GET)){
		    		if(!isset($_GET['success'],$_GET['paymentId'],$_GET['PayerID']) || (bool)$_GET['success'] === false){
						$this->cancelOrder();
		    			 header("Location: http://localhost/pattywhack/mvc/public/home");	
		    			 return;
		    		}

		    		
		    			
		    		
		    		$getresult = 'success=' . $_GET['success'] . '&paymentId=' .$_GET['paymentId'] . '&PayerID=' . $_GET['PayerID'];
		    		$_SESSION['result'] = $getresult;

	    			$paymentId = $_GET['paymentId'];
		    		$PayerID = $_GET['PayerID'];

		    		$payment = Payment::get($paymentId,$this->paypal);

		    		$execute = new PaymentExecution();
		    		$execute->setPayerId($PayerID);


			    		try{
			    			$result = $payment->execute($execute, $this->paypal);	  
			    			$allOrders = $this->model('Orders')->get();
							$updateOrder = $allOrders->where('order_id', $_SESSION['order_id'])->first();
							$updateOrder->status_id = 9;
							$updateOrder->save();  			

			    		}catch(Exception $e){
			    			$this->view('home/userAccount');
			    		}
		    		
		    		}


			        header("Location: http://localhost/pattywhack/mvc/public/home/userAccount");	

    	}

    private function cancelOrder(){
    	   $allOrders = $this->model('Orders')->get();
			$updateOrder = $allOrders->where('order_id', $_SESSION['order_id'])->first();
			$updateOrder->status_id = 3;
			$updateOrder->save();
    }
    
    public function viewOrder($id)
    {   
        $this->view('home/viewOrder', ['order_id'=>$id]);
    }
    
    public function rateOrder($id, $rate)
    {
        $rateThis = $this->model('orders')->where('order_id', $id)->first();
        $rateThis->rating = $rate;
        $rateThis->save();
        header("Location: http://localhost/pattywhack/mvc/public/home/userAccount");
    }

    public function userAccount(){
    	if($this->checkAuth()){   		    		
	    		$this->view('home/userAccount');
	    	}
	    	else{
	    		$this->view('home/index');
	    	}
		}

	
    
    public function shippingWorker(){
		$this->view('home/shippingWorker');
	}
    
        public function adminPanel(){
		$this->view('home/adminPanel');
	}
    
        public function request(){
		$this->view('home/request');
	}

        public function devtest(){
		$this->view('home/devtest');
	}
    
    public function contact() {
        $this->view('home/contact');
    }
	public function logUser(){
		if(!empty($_POST["UserLogin"])){

			$getUserByUsername = $this->model('user');
			if($getUserByUsername->where('username' , $_POST["UserLogin"])->exists()){

				$hash = $getUserByUsername->where('username' , $_POST["UserLogin"])->first()->password_hash;

				$verify = password_verify($_POST["PasswordLogin"], $hash);
				if($verify){
					$_SESSION['user'] = $_POST["UserLogin"];
					$_SESSION['email'] = $getUserByUsername->first()->email;
					header("Location: http://localhost/pattywhack/mvc/public/home");				
				}
				else{
					$this->view('home/login',['message'=>"Wrong password"]);
				}
			}
			else{
				$this->view('home/login',['message'=>"Wrong username"]);
			}
		}
	}

	public function getURL(){
		return $getURLs = $this->model('RequestURL')->where('status_id', 1)->get();
	}
    
    public function deleteOrder($orderId, $whereFrom) 
    {
        //server request URI
        $currPage = $_SERVER['REQUEST_URI'];
        $toDelete = $this->model('orders')->where('order_id', $orderId)->first();
        $toDelete->status_id = 3;
        $toDelete->save();
        
        if ($whereFrom == 2)
            header("Location: http://localhost/pattywhack/mvc/public/home/userAccount");
        else
            header("Location: http://localhost/pattywhack/mvc/public/home/shippingWorker");
        
    }
    
    public function listQuestions(){
        return $this->model('question')->get();
        
    }
    
    
    public function viewConversation($viewable) 
    {
        
        $masterQuestion []  = $this->model('question')->where('question_id', $viewable)->first();
        $conversation = array();
        $responses = $this->model('response')->where('question_id', $viewable)->get();
        
        if ($responses->get(0)->answer !== null)
        {
            $question = $this->model('question')->where('question_id', $viewable)->first();
            $question->status_id = 2;
            $question->save();
            
        }
        else
        {
            $question = $this->model('question')->where('question_id', $viewable)->first();
            $question->status_id = 1;
            $question->save();
        }
            

        for ($i = 0; $i < $responses->count(); $i++)
        {
            //var_dump($responses);
            array_push($conversation , $responses->get($i));
            //print $responses->get($i);
            //$this->view('home/conversation', ['resp' . $i, $conversation[$i]]);
        }
        //this works only if there is a question and no responses...
        //var_dump($conversation);
        $_SESSION['converse'] = $conversation;
        $this->view('home/conversation', ['conv'=>$masterQuestion]);

        
    }
    
    public function addResponse() 
    {
        
        $sentBy = $_SESSION['user'];
        $message = $_POST['newMessage'];
        $questionID = $_POST['questID'];
        
        $respToAdd = $this->model('response');
        $respToAdd->question_id = $questionID;
        $respToAdd->username = $sentBy;
        $respToAdd->answer = $message;
        //print_r ($respToAdd);
        
        $respToAdd->save();
        header("Location: http://localhost/pattywhack/mvc/public/home/viewConversation/" . $questionID);
        
        
    }
    
    public function addQuestion()
    {
        $quesToAdd = $this->model('question');
        
        if(isset($_SESSION['user']))
            $quesToAdd->username = $_SESSION['user'];
        else
           $quesToAdd->username = $_POST['emailBox'];
        
        
        $quesToAdd->question = $_POST['qBox'];
        $quesToAdd->status_id = 1;
        
        $quesToAdd->save();
        header("Location: http://localhost/pattywhack/mvc/public/home/contact");
    }


	public function checkAuth(){
		if(isset($_SESSION['user'])) {
			$getUserByUsername = $this->model('user');
			$auth = $getUserByUsername->where('username' , $_SESSION["user"])->first()->authority_id;
			if($auth >= 4){
				return TRUE;
			}
			else{
				return false;
			}
        }
        else{
        return false;
    	}
	}

	public function logOut(){
		unset($_SESSION['user']);
		header("Location: http://localhost/pattywhack/mvc/public/home");	
	}
    

    public function getCategory() {
        $getCat = $this->model('preference')->get();
        $toReturnStr = "";
        for ($i = 0; $i < $getCat->count(); $i++)
        {
            $category =  $getCat->get($i)->preference_category;
            $toReturnStr = $toReturnStr . "<option value='" . $category . "'>" . $category . "</option>";
        }
        print $toReturnStr;
    }
    
    public function listAllPref() {
        error_reporting(E_ERROR | E_WARNING | E_PARSE);
        $getCat = $this->model('preference')->get();
        $getUserPrefs = $this->model('preference_detail')->where('username', $_SESSION["user"])->get();
        $toReturnStr = "";
        for ($i = 0; $i < $getCat->count(); $i++)
        {
            $category =  $getCat->get($i)->preference_category;
            $categoryID = $getCat->get($i)->preference_id;
            $prefExits = $getUserPrefs->where('preference_id', $categoryID)->first()->preference_id;
             //var_dump($prefExits);
            //print $prefExits;
            //If any user prefs match the current category ID, make the inputs checked
            if($prefExits == $categoryID)
            { 
                //print "in Checked if Statement";
                //print $getUserPrefs->where('preference_id', $categoryID);
                $toReturnStr = $toReturnStr . "<li>" . "<input type=checkbox value=" . $categoryID . " name=" . $categoryID . " checked>" . "<label>" . $category . "</label>" . "</li>";
                
            }
            else 
            {
            //var_dump($getUserPrefs);
            $toReturnStr = $toReturnStr . "<li>" . "<input type=checkbox value=" . $categoryID . " name=" . $categoryID . ">" . "<label>" . $category . "</label>" . "</li>";
            }
        }
        print $toReturnStr;
    }
    
    public function updatePreference() 
    {
        //error_reporting(E_ERROR | E_WARNING | E_PARSE);
        //$userPref = new preference_detail;
        

        $userPref = $this->model('preference_detail')->where('username', $_SESSION["user"])->get();
        /*echo '<pre>';
		//var_dump($userPref);
		var_dump($_POST);
		echo '</pre>';*/

        for ($i = 0; $i < 24; $i++)
        {
        	//var_dump($userPref->where('preference_id', $i)->first()->preference_id);
        	if (isset($_POST[$i])){
	           $pref = $userPref->where('preference_id', $i)->first();
	        	if($pref === null){
					try{
						$prefToAdd = $this->model('preference_detail');
						$prefToAdd->username = $_SESSION['user'];
						$prefToAdd->preference_id = $_POST[$i];
						$prefToAdd->save();
					}
					catch(Exception $e){
						echo "failed Insert!     <br/><br/><br/>" ;//. $e;
	                }
	            }
            }
            else{
            	$pref2 = $userPref->where('preference_id', $i)->first();
            	if(isset($pref2) && $pref2->exists()){
					try{
						$pref2->delete();
					}
					catch(Exception $e){
						echo "failed delete!     <br/><br/><br/>" ;//. $e;
	                }
	            }
            }

            header("Location: http://localhost/pattywhack/mvc/public/home/userAccount");
        
    }
}


	public function addValidURL(){
		$url = null;
		$amazon = "amazon.ca";
		$ebay = "ebay.ca";
		$ebid = "ebid.net";
		
		if(!empty($_POST['reqURL'])){
			$url = $_POST['reqURL'];
			$url = filter_var($url, FILTER_SANITIZE_URL);			
			if( strpos($url, $amazon) != FALSE || strpos($url, $ebay) != FALSE || strpos($url, $ebid) != FALSE ){
				$getURLs = $this->model('RequestURL');
				if(!($getURLs->where('url', $url)->exists())){
					$itemRequest = $this->model('RequestURL');
					$itemRequest->url = urlencode($url);	
					$itemRequest->save();
				}		
			}
		}
		header("Location: http://localhost/pattywhack/mvc/public/home/request");
	}

	private function innerHTML(DOMNode $elm) { 
		  $innerHTML = ''; 
		  $children  = $elm->childNodes;

		  foreach($children as $child) { 
		    $innerHTML .= $elm->ownerDocument->saveHTML($child);
		  }

		  return $innerHTML;
	}


	public function parseAmazon($urlendoed, $changeRequest = true){	
		if($this->checkAuth()){
			error_reporting(E_ERROR | E_WARNING | E_PARSE);
			$url = urldecode($urlendoed);
			$providerID = 1;
			if($url != null){
				$dom = file_get_contents($url);	



				$pattern = "/<span class=\"nav-a-content\">(.+)<\/span>/";
				preg_match($pattern, $dom, $category);
				$pos = strpos($category[1],"<");
				$category = substr($category[1], 0, $pos);
				$catchCat = $this->matchCategory($category);
				//var_dump($catchCat); print "<br/>";
				$titleSubString = substr($dom, strpos($dom,"<span id=\"productTitle\" class=\"a-size-large\">"));
				$titleTag = rtrim(substr($titleSubString, 0,strpos($titleSubString,"</span>")), " \t\n\r\0\x0B");
				//var_dump($titleTag);			
				$dochtml = new DOMDocument();
				$dochtml->loadHTML($titleTag);
				$span = $dochtml->getElementById('productTitle');
				$title = $this->innerHTML($span);
				$title = trim($title);
				$price = null;
				if($catchCat !== 11){
				$priceSubstring = substr($dom, strpos($dom,"<span id=\"priceblock_ourprice\" class=\"a-size-medium a-color-price\">"));
				$priceTag = rtrim(substr($priceSubstring, 0,strpos($priceSubstring,"</span>")), " \t\n\r\0\x0B");

					$dochtml = new DOMDocument();
					$dochtml->loadHTML($priceTag);
					$span = $dochtml->getElementById('priceblock_ourprice');
					$price = $this->innerHTML($span);
					preg_match("/[0-9]+.[0-9]+/", $price, $price);
					//var_dump($price[0]);
				}else{
					$priceSubstring = substr($dom, strpos($dom,"<span class=\"a-size-medium a-color-price offer-price a-text-normal\">"));
					$priceTag = rtrim(substr($priceSubstring, 0,strpos($priceSubstring,"</span>")), " \t\n\r\0\x0B");
					preg_match("/[0-9]+.[0-9]+/", $priceTag, $price);
					//var_dump($price[0]);
				}
				if($price[0] !== null){
				$product = $this->model('product');
								$product->product_name = $title;
								$product->url = $urlendoed;
								$product->unit_price = $price[0]*1.20;
								$product->item_shipping_cost = ($price[0]*0.10);
								$product->provider_id = $providerID;
								$product->category_id = $catchCat;
								$product->save();
								if($changeRequest){
									$request = $this->model('RequestURL')->where('url', $urlendoed)->first();
									if($request->exists()){
										$request->status_id = 6;
										$request->save();
									}
								}
				}			
								$this->view('home/adminPanel');
		/*
		https://www.amazon.ca/Playtex-Diaper-Genie-Disposal-System/dp/B00LCR1KZO/ref=gbph_img_m-6_7b56_e18c27a8?smid=A3DWYIK6Y9EEQB&pf_rd_p=ef10e933-94dc-4f20-bbee-3a13e9607b56&pf_rd_s=merchandised-search-6&pf_rd_t=101&pf_rd_i=3561346011&pf_rd_m=A3DWYIK6Y9EEQB&pf_rd_r=4YRVC6FCDDMKF52F1B5Z
		*/

			}
			
		}else{
				$this->view('home/index');
			}
	}


	public function parseEBAY($urlendoed, $changeRequest = true){
		if($this->checkAuth()){
			$url = urldecode($urlendoed);
			$providerID = 2;
			if($url != null){
				$dom = file_get_contents($url);		

				$pattern = "/<h1 class=\"it-ttl\" .+ id=\"itemTitle\"><span class=\"g-hdn\">.+<\/span>+(.+)+<\/h1>/";
				preg_match($pattern, $dom, $title);
				$pattern2 = "/<span .+ id=\"prcIsum\" itemprop=\"price\".+>+(.+)+<\/span>/";
				preg_match($pattern2, $dom, $priceAndCurrency);
				preg_match("/[0-9]+\.[0-9]+/", $priceAndCurrency[1], $price);
				$pattern3 = "/<ul .+ itemtype=\"http:\/\/schema.org\/BreadcrumbList\">+[[:space:]]+(.+)/";
				preg_match($pattern3, $dom, $categories);
				preg_match("/<span itemprop=\"name\">(.+)<\/span>/", $categories[1], $category);

				$product = $this->model('product');
								$product->product_name = $title[1];
								$product->url = $urlendoed;
								$product->unit_price = $price[0]*1.20;
								$product->item_shipping_cost = ($price[0]*0.10);
								$product->provider_id = $providerID;
								$product->category_id = $this->matchCategory($category[1]);
								$product->save();
								if($changeRequest){
									$request = $this->model('RequestURL')->where('url', $urlendoed)->first();
									if($request->exists()){
										$request->status_id = 6;
										$request->save();
									}
								}			
								$this->view('home/adminPanel');
							}
							
		}else{
								$this->view('home/index');
							}
	}

	

	public function parseEBid($urlendoed, $changeRequest = true){
		if($this->checkAuth()){
			$url = urldecode($urlendoed);
			$providerID = 3;
			if($url != null){
				$dom = file_get_contents($url);
				$pattern = "/<h1 itemprop=\"name\">(.+)<\/h1>/";
				preg_match($pattern, $dom, $title);
				$pattern2 = "/<span class=\"fs-12\">(.+)<\/span>/";
				preg_match($pattern2, $dom, $priceAndCurrency);
				preg_match("/[0-9]+\.[0-9]+/", $priceAndCurrency[1], $price);
				$pattern3 = "/>.+<A HREF='http:\/\/www.ebid.net\/ca\/buy\/(.+)\/'.>/";
				preg_match($pattern3, $dom, $categories);
				$category = substr($categories[1],0,strpos($categories[1],'/'));

				$product = $this->model('product');
								$product->product_name = $title[1];
								$product->url = $urlendoed;
								$product->unit_price = $price[0]*1.20;
								$product->item_shipping_cost = ($price[0]*0.10);
								$product->provider_id = $providerID;
								$product->category_id = $this->matchCategory($category[1]);
								$product->save();
								if($changeRequest){
									$request = $this->model('RequestURL')->where('url', $urlendoed)->first();
									if($request->exists()){
										$request->status_id = 6;
										$request->save();
									}
								}	
								$this->view('home/adminPanel');
							}
							
		}else{
								$this->view('home/index');	
							}
	}



	public function createUser(){
		$email = isset($_POST["EmailBox"]) ? $_POST["EmailBox"] : '';
		$address = isset($_POST["AddressBox"]) ? $_POST["AddressBox"] : '';
		$postalCode = isset($_POST["PostalCodeBox"]) ? $_POST["PostalCodeBox"] : '';
		$username = isset($_POST["UsernameBox"]) ? $_POST["UsernameBox"] : '';
		$userUsername = $this->model('user')->where('username', $_POST['UsernameBox'])->get();
		$userEmail = $this->model('user')->where('email', $_POST['EmailBox'])->get();
		$passHash = password_hash($_POST["PasswordBox"], PASSWORD_DEFAULT);
		if(isset($_POST)){
			
			

			if($userUsername->count() != 0 && $userEmail->count() != 0)				
				$this->view('home/register',['message'=>"Username and email are both in use. (Log in to account)", 'email'=> $email,'address'=>$address,'pCode'=>$postalCode , 'username'=>$username ]);			
			elseif($userUsername->count() != 0)		
				$this->view('home/register',['message'=>"Username already in use.", 'email'=> $email,'address'=>$address,'pCode'=>$postalCode, 'username'=>$username]);
			elseif($userEmail->count() != 0){
				if($userEmail->first()->authority_id == 3){
					//$userEmail->first()->username = $username;
					$userEmail->first()->password_hash = $passHash;
					$userEmail->first()->address = $address;
					$userEmail->first()->postal_code = $postalCode;
					$userEmail->first()->authority_id = 1;
					$userEmail->first()->save();
				}
				else
					$this->view('home/register',['message'=>"Email is already assigned to an account", 'email'=> $email,'address'=>$address,'pCode'=>$postalCode, 'username'=>$username]);
			}
			else{
				$newguy = new User;
				$newguy->username = $username;
				$newguy->password_hash = $passHash;
				$newguy->address = $address;
				$newguy->postal_code = $postalCode;
				$newguy->email = $email;
				$newguy->save();
			}
		}
		header("Location: http://localhost/pattywhack/mvc/public/home/index");
	}

	public function editUser(){
		if(isset($_POST)){
			$getUserByUsername = $this->model('user');
			$user = $getUserByUsername->where('username' , $_SESSION["user"])->first();
			$hash = $user->password_hash;
			$verify = password_verify($_POST["oldPassBox"], $hash);
			if($verify){			
				if(isset($_POST['addrBox']) && strlen($_POST['addrBox']) > 0)
						$user->address = $_POST['addrBox'];
					if(isset($_POST['postalBox']) && strlen($_POST['postalBox']) > 0)
						$user->postal_code = $_POST['postalBox'];

				if(isset($_POST['NewPassBox']) && isset($_POST['conNewPassBox'])){
                   if(strlen($_POST['NewPassBox']) > 0 && strlen($_POST['conNewPassBox']) > 0)
					if($_POST['NewPassBox'] === $_POST['conNewPassBox']){
						$password = password_hash($_POST['NewPassBox'], PASSWORD_DEFAULT);
						$user->password_hash = $password;
					}
                    
					else{
						$this->view('home/userAccount',['message'=>"Wrong password", 'addressBox' => $_POST['addrBox'], 'postalCodeBox' => $_POST['postalBox']]);
					}
                    
				}
				$user->save();
                header("Location: http://localhost/pattywhack/mvc/public/home/userAccount");
			}
			else{
				$this->view('home/userAccount',['message'=>"Wrong password", 'addressBox' => $_POST['addrBox'], 'postalCodeBox' => $_POST['postalBox']]);
			}
            
		}
	}
	public function parseLink(){
		if($this->checkAuth()){
			
			$differentSiteValidationFields =  array('adminProdURL', 'adminProdName', 'adminProdPrice', 'adminProdCategory');
			$error = false;
			foreach($differentSiteValidationFields as $field) {
			  if (empty($_POST[$field])) {
			    $error = true;
			  }
			}
			if(!empty($_POST['adminProdURL'])){
				$URLencoded = urlencode($_POST['adminProdURL']);
				$amazon = "amazon.ca";
				$ebay = "ebay.ca";
				$ebid = "ebid.net";
				$providerID;
				if(strpos($URLencoded, $amazon) != FALSE)
					$providerID = 1;
				elseif(strpos($URLencoded, $ebay) != FALSE)
					$providerID = 2;
				elseif(strpos($URLencoded, $ebid) != FALSE)
					$providerID = 3;
				else
					$providerID = 4;
				
				if(!$error){
					$product = $this->model('product');
							$product->product_name = $_POST['adminProdName'];
							$product->url = $URLencoded;
							$product->unit_price = $_POST['adminProdPrice']*1.20;
							$product->item_shipping_cost = ($_POST['adminProdPrice']*0.10);
							$product->provider_id = $providerID;
							$product->category_id = $this->matchCategory($_POST['adminProdCategory']);
							$product->save();
				}
				elseif(strpos($URLencoded, $amazon) != FALSE){					
					$this->parseAmazon($URLencoded, false);
				}
				elseif(strpos($URLencoded, $ebay) != FALSE){					
					$this->parseEBAY ($URLencoded, false);
				}
				elseif(strpos($URLencoded, $ebid) != FALSE){
					$this->parseEBid($URLencoded, false);
				}
				
			}
			$this->view('home/adminPanel');
		}else{
			$this->view('home/index');
		}
	}


	public function addProduct($id){
		if($this->checkAuth()){
			$requests = $this->model('RequestURL');
			$request = $requests->where('request_id' , $id)->first();
			if($request->exists()){
				$amazon = "amazon.ca";
				$ebay = "ebay.ca";
				$ebid = "ebid.net";
				if(strpos($request->url, $amazon) != FALSE){
					//echo $request->url . "      AMAZON"; 
					$this->parseAmazon($request->url);
				}
				elseif(strpos($request->url, $ebay) != FALSE){
					//echo $request->url . "      EBAY"; 
					$this->parseEBAY ($request->url);
				}
				elseif(strpos($request->url, $ebid) != FALSE){
					//echo $request->url . "      EBID"; 
					$this->parseEBid($request->url);
				}
				else
					echo "Error...";
			}
		}
		else{
			$this->view('home/index');
		}
	}


	public function denyProduct($id){
		if($this->checkAuth()){
			$requests = $this->model('RequestURL');
			$request = $requests->where('request_id' , $id)->first();
			if($request->exists()){
				$request->status_id = 7;				
				$request->save();
				$this->view('home/adminPanel');
			}
		}
		else{
			$this->view('home/index');
		}
	}
    
    public function matchCategory($toMatch) {
        $matchedCat = "";
        if($toMatch == "" || $toMatch == null)
        	return 25;
        $allCats = $this->model('Preference')->get();
       
        for($i = 0; $i < $allCats->count(); $i++)
        {
            similar_text($allCats->get($i)->preference_category, $toMatch, $matchScore);
            $scoreArray[] = $matchScore;            
            
        }
        
        $j = array_search(max($scoreArray), $scoreArray);
        var_dump($scoreArray);
        if($scoreArray[$j] !== 1 &&  $scoreArray[$j] < 40){
        	$j = 21;
        }
        $allCats = $this->model('preference')->get();
        $matchedCat = $allCats->get($j)->preference_id;
        
	    return $matchedCat;
        
    }

    private function prepareOrder(){
    	//error_reporting(0);
    	$budget = $_SESSION['budget'];
    	$order = $this->model('Orders');
    	$order->username = $_SESSION['user'];
    	$order->budget = $budget;
    	$order->shipping_address = $_POST['ShipAddr'];
    	$order->price_per_item = $_SESSION['MPPI'];
    	$order->save();
		//echo  "<br/><br/><br/><br/>Budget:   " . $budget."<br/>" ;
    	$orderID = $this->model('Orders')->orderBy('date','DESC')->first()->order_id;

    	$preference = $this->model('Preference_detail');
		$preference = $preference->where('username', $_SESSION['user'])->get();
		
		if($preference->count() == 0){
			$preference = $this->model('Preference')->get();
		}
		$products = $this->model('Product');
		$product = array();
		
		foreach ($preference as $pref) {
			if(!empty($_SESSION['MPPI'])){	
				$productInOrder = $products
						->where('category_id', $pref->preference_id)
						->where('unit_price', '<=', $_SESSION['MPPI'])		
						->where('availability', 4)				
						->orderBy('unit_price', 'ASC')
						->get();
			}
			else{				
				$productInOrder = $products
						->where('category_id', $pref->preference_id)
						->where('unit_price', '<=', $budget)
						->where('availability', 4)
						->orderBy('unit_price', 'ASC')
						->get();
			}
			$productUnavailableinPref =  $products
											->where('category_id', $pref->preference_id)
											->where('availability', 5)
											->get();


			if($productUnavailableinPref->count() != 0 && $productInOrder->count() == 0){
				if(!empty($_SESSION['MPPI']))
 					$productInOrder = $products->where('availability', 4)->where('unit_price', '<=', $_SESSION['MPPI'])->orderBy('unit_price', 'ASC')->get();
 				else
 					$productInOrder = $products->where('availability', 4)->where('unit_price', '<=', $budget)->orderBy('unit_price', 'ASC')->get();

 				for($i = 0; $i < $productInOrder->count(); $i++){
					$product[] = $productInOrder->get($i);
				}

 				break;
			}

			for($i = 0; $i < $productInOrder->count(); $i++){
				$product[] = $productInOrder->get($i);
			}
		}

		if(empty($product)){
			$this->view('home/placeOrder', ['message'=> "Please insert a higher budget price or a higher item limit."]);
			die();
		}

		$index = count($product)-1;
		$total = 0;
		
		while($budget > $product[0]->unit_price){
			//echo "Price of Lowest Item:   " . $product[0]->unit_price . "<br/>";
			
			$randomLimit = rand(0,$index);
			
			//echo  $product[$randomLimit]->unit_price. "<br/>";
			if($product[$randomLimit]->unit_price <= $budget){
			$orderDetail = $this->model('order_detail');
			$orderDetail->order_id = $orderID;
			$orderDetail->product_id = $product[$randomLimit]->product_id;
			$orderDetail->item_price = $product[$randomLimit]->unit_price;
			$orderDetail->save();
			$total = $total + $product[$randomLimit]->unit_price;
			$budget = $budget - $product[$randomLimit]->unit_price;
			}
			else{
				$index = $randomLimit -1;
			}
		}
		
		if($total != 0){
			$shippingCost = ($total * (1.0/6.0))/2.0;
			$allOrders = $this->model('Orders')->get();
			$updateOrder = $allOrders->where('order_id', $orderID)->first();
			$updateOrder->total = $total;
			$updateOrder->shipping_cost = $shippingCost;
			$updateOrder->save();
			$_SESSION['order_id'] = $orderID;
		}
		else{
				$this->view('home/placeOrder', ['message'=> "Please insert a higher budget price or a higher item limit."]);
				die();

		}
		return $product;
    	
    }
    
    public function editProduct($id){
    	if($this->checkAuth()){
    		$product = $this->model('product')->where('product_id', $id)->get();
    		if($product->count() != 0){

    			$product = $product->first();
    			if(!empty($_POST['productName']))
    				$product->product_name = $_POST['productName'];
	    		if(!empty($_POST['productPrice']))
	    			$product->unit_price = $_POST['productPrice'];
	    		if(!empty($_POST['shippingCost']))
	    			$product->item_shipping_cost = $_POST['shippingCost'];
	    		if(!empty($_POST['url'])){
	    			$url = urlencode($_POST['url']);
	    			$product->url = $url;
	    		}
	    		if(isset($_POST['availBox']))	    			
	    			$product->availability = 4;
	    		else
	    			$product->availability = 5;
    		}
    		
    		$product->save();

    		header("Location: http://localhost/pattywhack/mvc/public/home/adminPanel");
    	}
    	else
    		header("Location: http://localhost/pattywhack/mvc/public/home");
    }
    
	
}
?>
