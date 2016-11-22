<?php
use Illuminate\Http\Request as Request;

class Home extends Controller{
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

    public function confirmOrder(){
    	$product = $this->prepareOrder();
    	//echo "<br/><br/><br/><br/>";
    	//print_r($product);


		$this->view('home/confirmOrder');
	}
    
    public function insertOrder(){
        header("Location: http://localhost/pattywhack/mvc/public/home");	
		$this->view('home/index');
	}
    
    public function userAccount(){
		$this->view('home/userAccount');
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
        
        $quesToAdd->username = $_SESSION['user'];
        $quesToAdd->question = $_POST['qBox'];
        $quesToAdd->status_id = 1;
        
        $quesToAdd->save();
        header("Location: http://localhost/pattywhack/mvc/public/home/contact");
    }


	public function checkAuth(){
		if(isset($_SESSION['user'])) {
			$getUserByUsername = $this->model('user');
			$auth = $getUserByUsername->where('username' , $_SESSION["user"])->first()->authority_id;
			if($auth == 4){
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
        echo '<pre>';
		//var_dump($userPref);
		var_dump($_POST);
		echo '</pre>';

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
		if(isset($_POST)){
			$passHash = password_hash($_POST["PasswordBox"], PASSWORD_DEFAULT);
			$newguy = new User;
			$newguy->username = $_POST["UsernameBox"];
			$newguy->password_hash = $passHash;
			$newguy->address = $_POST["AddressBox"];
			$newguy->postal_code = $_POST["PostalCodeBox"];
			$newguy->email = $_POST["EmailBox"];// Hash::check($_POST["password"], $hashedPassword)
			/*$newguy = User::create([
					'username' => $_POST["UsernameBox"],
					'password_hash' => $passHash, 
					'address' => $_POST["AddressBox"],
					'postal_code'=> $_POST["PostalCodeBox"],
					'email'	=> $_POST['EmailBox']
				]);*/
			
			$getUserByEmail = User::where('username' , $_POST["UsernameBox"])->get();
			
			if($newguy->isValid() && ($getUserByEmail->count() == 0)){
				$newguy->save();
				header("Location: http://localhost/pattywhack/mvc/public/home");			

			}		
			else{
				if(isset($_POST["EmailBox"]) && isset($_POST["AddressBox"]) && isset($_POST["PostalCodeBox"]))
					$this->view('home/register',['message'=>"Username already in use.", 'email'=>$_POST["EmailBox"],'address'=>$_POST["AddressBox"],'pCode'=>$_POST["PostalCodeBox"]]);

			}
			
		}
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
				$providerID = 4;				
				if(strpos($URLencoded, $amazon) != FALSE){					
					$this->parseAmazon($URLencoded, false);
				}
				elseif(strpos($URLencoded, $ebay) != FALSE){					
					$this->parseEBAY ($URLencoded, false);
				}
				elseif(strpos($URLencoded, $ebid) != FALSE){
					$this->parseEBid($URLencoded, false);
				}
				elseif (!$error) {
					
					$product = $this->model('product');
							$product->product_name = $_POST['adminProdName'];
							$product->url = $URLencoded;
							$product->unit_price = $_POST['adminProdPrice']*1.20;
							$product->item_shipping_cost = ($_POST['adminProdPrice']*0.10);
							$product->provider_id = $providerID;
							$product->category_id = $this->matchCategory($_POST['adminProdCategory']);
							$product->save();
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
        $allCats = $this->model('preference')->get();
       
        for($i = 0; $i < $allCats->count(); $i++)
        {
            similar_text($allCats->get($i)->preference_category, $toMatch, $matchScore);
            $scoreArray[] = $matchScore;            
            
        }
        
        $j = array_search(max($scoreArray), $scoreArray);
        
        if($scoreArray[$j] !== 1 &&  $scoreArray[$j] < 50){
        	$j = 22;
        }
        $matchedCat = $allCats->get($j)->preference_id;
        //var_dump($matchedCat);
	    return $matchedCat;
        
    }

    private function prepareOrder(){
    	error_reporting(0);
    	$budget = $_SESSION['budget'];
    	$order = $this->model('orders');
    	$order->username = $_SESSION['user'];
    	$order->budget = $budget;
    	$order->shipping_address = $_POST['ShipAddr'];
    	$order->price_per_item = $_SESSION['MPPI'];
    	$order->save();

    	$orderID = $this->model('orders')->orderBy('date','DESC')->first()->order_id;

    	$preference = $this->model('preference_detail');
		$preference = $preference->where('username', $_SESSION['user'])->get();
		$products = $this->model('product');
		$product = array();
		
		foreach ($preference as $pref) {
			if(!empty($_SESSION['MPPI']))
			$products = $products
						->where('category_id', $pref->preference_id)
						->where('unit_price', '<=', $_SESSION['MPPI'])
						->orderBy('unit_price', 'ASC')
						->get();
			else
				$products = $products
						->where('category_id', $pref->preference_id)
						->where('unit_price', '<=', $budget)
						->orderBy('unit_price', 'ASC')
						->get();
			for($i = 0; $i < $products->count(); $i++){
				//echo "          " .$products->count();
				$product[] = $products->get($i);
			}
		}
		
		$index = 0;
		while($budget > $product[0]->unit_price){
			echo $budget . "<br/>";
			for($j = 0; $j < count($product); $j++){
				if($product[$j]->unit_price < $budget)
					$index = $j;
				else {
					break;
				}
			}
			$randomLimit = rand(0,$index);
			if($index === 0)
				break;
			echo  $product[$randomLimit]->unit_price. "<br/>";
			$orderDetail = $this->model('order_detail');
			$orderDetail->order_id = $orderID;
			$orderDetail->product_id = $product[$randomLimit]->product_id;
			$orderDetail->item_price = $product[$randomLimit]->unit_price;
			//$orderDetail->save();
			$budget = $budget - $product[$randomLimit]->unit_price;
			echo $budget . "<br/>";
		}
		return $product;
    	
    }
    
    
	
}
?>
