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
                echo "<br/><br/><br/><br/><br/><br/> Error";

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


	public function addValidURL(){
		$url = null;
		$amazon = "amazon.ca";
		$wish = "wish.com";
		$etsy = "etsy.com/ca";
		$url = filter_var($url, FILTER_SANITIZE_URL);
		if(isset($_POST['reqURL'])){
			$url = $_POST['reqURL'];			
			if( strpos($url, $amazon) !== FALSE || strpos($url, $wish) !== FALSE  || strpos($url, $etsy) !== FALSE ){
				$getURLs = $this->model('RequestURL');
				if(!($getURLs->where('url', $url)->exists())){
					$itemRequest = $this->model('RequestURL');
					$itemRequest->url = $url;	
					$itemRequest->save();
				}		
			}
		}
		header("Location: http://localhost/pattywhack/mvc/public/home/request");
	}



	public function parseAmazon($url){	
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
						echo '<pre>';
						echo $title[1];
						echo "<br/>";
						echo $price[0];
						echo "<br/>";
						echo $category[1];
						echo '</pre>';
					}
				
				}
				else {
					$pattern = "/<span id=\"priceblock_ourprice\".+>(.+)+<\/span>/";
					preg_match($pattern, $dom, $currencyPrice);
					if(count($currencyPrice) > 0){
				preg_match("/[0-9]+.[0-9]+/", $currencyPrice[1], $price);

				$pattern3 = "/<a class=\"a-link-normal a-color-tertiary\".+>[[:space:]]+(.+)[[:space:]]+<\/a>/";
				preg_match($pattern3, $dom, $category);				
					if(count($currencyPrice) > 0 &&  count($category) > 0 ){
						echo '<pre>';
						echo $title[1];
						echo "<br/>";
						echo $price[0];
						echo "<br/>";
						echo $category[1];
						echo '</pre>';
					}
				
				}
				}
			}
		}
	}


	public function parseEtsy($url){
		if($url != null){
			$dom = file_get_contents($url);		

			$pattern = "/<span itemprop=\"name\">(.+)<\/span>/";
			preg_match($pattern, $dom, $title);
			
			if(count($title) > 0){
			$pattern2 = "/<span id=\"listing-price\".+>+[[:space:]]+(.+)/";
			preg_match($pattern2, $dom, $currencyPrice);
				if(count($currencyPrice) > 0){
				preg_match("/[0-9]+.[0-9]+/", $currencyPrice[1], $price);				
				
					if(count($currencyPrice) > 0){
						echo '<pre>';
						echo $title[1];
						echo "<br/>";
						echo $price[0];
						echo '</pre>';
					}				
				}	
			}
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
	
}
?>