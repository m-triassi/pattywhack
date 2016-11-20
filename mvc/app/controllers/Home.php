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
		$this->view('home/shipping');
	}

    public function confirmOrder(){
		$this->view('home/confirmOrder');
	}
    
    public function insertOrder(){
        header("Location: http://localhost/pattywhack/mvc/public/home");	
		$this->view('home/index');
	}
    
    public function userAccount(){
		$this->view('home/userAccount');
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
	public function logUser(){
		if(isset($_POST["UserLogin"])){

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
        

        $userPref = $this->model('preference_detail')->where('username', $_SESSION["user"]);
        
        var_dump($userPref);
        for ($i = 0; $i < 24; $i++)
        {
            //echo "<br/> __LOOPING HERE!__";
            //$toDel = $userPref->where('preference_id', $_POST[$i])->first();
            $toDel = $userPref->where('preference_id', $i)->first();
            //var_dump($toDel);
           if (isset($_POST[$i]))
           {
               print $i . " in IF <br/><br/><br/>";
               
               try 
               {
               $userPref->username = $_SESSION['user'];
               $userPref->preference_id = $_POST[$i];
               
               $userPref->save();
              }
               catch(Exception $e)
               {
                   echo "failed Insert!     <br/><br/><br/>" . $e;
               }
            }
            elseif($userPref->where('preference_id', $i)->first() != null)
            {
                try 
                {
                    var_dump($toDel);
                    echo " IN ELSEIF<br/>";
                    $toDel->delete();
                    
                }
                catch(Exception $e)
                {
                    //echo $e;
                }
            }  
        }
        
        
    }


	public function addValidURL(){
		$url = null;
		$amazon = "amazon.ca";
		$ebay = "ebay.ca";
		$ebid = "ebid.net";
		
		if(isset($_POST['reqURL'])){
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

	public function innerHTML(DOMNode $elm) { 
		  $innerHTML = ''; 
		  $children  = $elm->childNodes;

		  foreach($children as $child) { 
		    $innerHTML .= $elm->ownerDocument->saveHTML($child);
		  }

		  return $innerHTML;
	}


	public function parseAmazon($urlendoed){	
		$url = urldecode($urlendoed);
		$providerID = 1;
		if($url != null){
			$dom = file_get_contents($url);	



			$pattern = "/<span class=\"nav-a-content\">(.+)<\/span>/";
			preg_match($pattern, $dom, $category);
			$pos = strpos($category[1],"<");
			$category = substr($category[1], 0, $pos);
			$catchCat = $this->matchCategory($category);

			$titleSubString = substr($dom, strpos($dom,"<span id=\"productTitle\" class=\"a-size-large\">"));
			$titleTag = rtrim(substr($titleSubString, 0,strpos($titleSubString,"</span>")), " \t\n\r\0\x0B");
			//var_dump($titleTag);			
			$dochtml = new DOMDocument();
			$dochtml->loadHTML($titleTag);
			$span = $dochtml->getElementById('productTitle');
			$title = $this->innerHTML($span);
			//var_dump(trim($title));

			$priceSubstring = substr($dom, strpos($dom,"<span id=\"priceblock_ourprice\" class=\"a-size-medium a-color-price\">"));
			$priceTag = rtrim(substr($priceSubstring, 0,strpos($priceSubstring,"</span>")), " \t\n\r\0\x0B");
			//var_dump($priceSubstring);
			
			$dochtml = new DOMDocument();
			$dochtml->loadHTML($priceTag);
			$span = $dochtml->getElementById('priceblock_ourprice');
			$price = $this->innerHTML($span);
			preg_match("/[0-9]+.[0-9]+/", $price, $price);
			var_dump($price[0]);
			



		}
	}


	public function parseEBAY($urlendoed){
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
							$product->url = $url;
							$product->unit_price = $price[0];
							$product->item_shipping_cost = ($price[0]*0.10);
							$product->provider_id = $providerID;
							$product->category_id = $this->matchCategory($category[1]);
							$product->save();
							$request = $this->model('RequestURL')->where('url', $url)->first();
							if($request->exists()){
								$request->status_id = 6;
								$request->save();
							}			
							$this->view('home/adminPanel');
		}
	}

	

	public function parseEBid($urlendoed){
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
							$product->url = $url;
							$product->unit_price = $price[0];
							$product->item_shipping_cost = ($price[0]*0.10);
							$product->provider_id = $providerID;
							$product->category_id = $this->matchCategory($category[1]);
							$product->save();
							$request = $this->model('RequestURL')->where('url', $url)->first();
							if($request->exists()){
								$request->status_id = 6;
								$request->save();
							}	
							$this->view('home/adminPanel');
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
        //similar_text($allCats->get(0)->preference_category, $toMatch, $matchScore);
        //print $matchScore;
        /*for($i = 1; $i < $allCats->count(); $i++)
        {
            //print $allCats->get($i)->preference_category . "<br/><br/>";
            //print stristr($allCats->get($i)->preference_category, $toMatch);
            
            if(stristr($allCats->get($i)->preference_category, $toMatch) !== false)
            {
               //print $allCats->get($i)->preference_category;
                //print stripos($allCats->get($i)->preference_category, $toMatch);
                print "first if ";
                similar_text($allCats->get($i)->preference_category, $toMatch, $tmpScore);
                if($tmpScore > $matchScore)
                {
                    $matchedCat = $allCats->get($i)->preference_category;
                    similar_text($allCats->get($i)->preference_category, $toMatch, $matchScore);
                }
                
                
            }
            elseif (stristr($toMatch, $allCats->get($i)->preference_category) !== false)
            {
                
                //similar_text($allCats->get($i)->preference_category, $toMatch, $matchScore);
                print "second if ";
                similar_text($allCats->get($i)->preference_category, $toMatch, $tmpScore);
                
                if($tmpScore > $matchScore)
                {
                    $matchedCat = $allCats->get($i)->preference_category;
                    similar_text($allCats->get($i)->preference_category, $toMatch, $matchScore);
                }
                
            }
            else 
            {
                //$matchedCat = "Random";    
                
            }
            
            
        }*/
        
        for($i = 0; $i < $allCats->count(); $i++)
        {
            similar_text($allCats->get($i)->preference_category, $toMatch, $matchScore);
            $scoreArray[] = $matchScore;            
            
        }
        
        $j = array_search(max($scoreArray), $scoreArray);
        
        //print_r ($scoreArray);
        $matchedCat = $allCats->get($j)->preference_id;
        //print $matchedCat;
        return $matchedCat;
        
    }
    
    
	
}
?>
