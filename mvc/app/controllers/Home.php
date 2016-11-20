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
        //error_reporting(E_ERROR | E_WARNING | E_PARSE);
        $getCat = $this->model('preference')->get();
        $getUserPrefs = $this->model('preference_detail')->where('username', $_SESSION["user"])->get();
        $toReturnStr = "";
        for ($i = 0; $i < $getCat->count(); $i++)
        {
            $category =  $getCat->get($i)->preference_category;
            $categoryID = $getCat->get($i)->preference_id;
            
            //If any user prefs match the current category ID, make the inputs checked
            if($getUserPrefs->where('preference_id', $categoryID) == $categoryID)
            {
                $toReturnStr = $toReturnStr . "<li>" . "<input type=checkbox value='" . $category . "' checked>" . "<label>" . $category . "</label>" . "</li>";
                
            }
            else
            //var_dump($getUserPrefs);
            $toReturnStr = $toReturnStr . "<li>" . "<input type=checkbox value='" . $categoryID . "'>" . "<label>" . $category . "</label>" . "</li>";
        }
        print $toReturnStr;
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



	public function parseAmazon($url){	
		$providerID = 1;
		if($url != null){
			$dom = file_get_contents($url);		

			$pattern = "/<span id=\"productTitle\".+>[[:space:]]+(.+)[[:space:]]+<\/span>/";
			preg_match($pattern, $dom, $title);
			
			if(count($title) > 0){
			$pattern2 = "/<span id=\"priceblock_saleprice\".+>(.+)+<\/span>/";
			preg_match($pattern2, $dom, $currencyPrice);
				if(count($currencyPrice) > 0){
				preg_match("/[0-9]+.[0-9]+/", $currencyPrice[1], $price);

				$pattern3 = "/<a class=\"a-link-normal a-color-tertiary\".+>[[:space:]]+(.+)[[:space:]]+<\/a>/";
				preg_match($pattern3, $dom, $category);
				
					if(count($currencyPrice) > 0 &&  count($category) > 0){
						echo $title[1];
						echo "<br/>";
						echo $price[0];
						echo "<br/>";
						echo $category[1];
					}
				
				}
				else {
					$pattern = "/<span id=\"priceblock_ourprice\".+>(.+)+<\/span>/";
					preg_match($pattern, $dom, $currencyPrice);
					if(count($currencyPrice) > 0){
				preg_match("/[0-9]+\.[0-9]+/", $currencyPrice[1], $price);

				$pattern3 = "/<a class=\"a-link-normal a-color-tertiary\".+>+[[:space:]]+(.+)[[:space:]]+<\/a>/";
				preg_match($pattern3, $dom, $category);				
					if(count($currencyPrice) > 0 &&  count($category) > 0 ){
						echo $title[1];
						echo "<br/>";
						echo $price[0];
						echo "<br/>";
						echo $category[1];
					}
				
				}
				}
			}
		}
	}


	public function parseEBAY($url){
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

			echo $title[1];
			echo "<br/>";
			echo $price[0];
			echo "<br/>";
			echo $category[1];
			//<h1 data-analytics-type=.+>(.+)<\/h1>
		}
	}

	

	public function parseEBid($url){
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

			echo $title[1];
			echo "<br/>";
			echo $price[0];
			echo "<br/>";
			echo $category;
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
					echo $request->url . "      AMAZON"; 
					$this->parseAmazon($request->url);
				}
				elseif(strpos($request->url, $ebay) != FALSE){
					echo $request->url . "      EBAY"; 
					$this->parseEBAY ($request->url);
				}
				elseif(strpos($request->url, $ebid) != FALSE){
					echo $request->url . "      EBID"; 
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
        $matchedCat = $allCats->get($j)->preference_category;
        print $matchedCat;
        return $matchedCat;
        
    }
	
}
?>
