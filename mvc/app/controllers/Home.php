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
				echo '<pre>';
				var_dump($getUserByUsername);
				echo '</pre>';
				$verify = password_verify($_POST["PasswordLogin"], $hash);
				if($verify){
					$_SESSION['user'] = $_POST["UserLogin"];
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

	public function logOut(){
		unset($_SESSION['user']);
		header("Location: http://localhost/pattywhack/mvc/public/home");	
	}


	public function addValidURL(){
		$url = null;
		$amazon = "/amazon.ca/"
		$wish = "/wish.ca/"
		$etsy = "/etsy.ca/"
		if(isset($_POST['website'])){
			$url = $_POST['website'];			
			if(count(preg_match($amazon, $url])) > 0  || count(preg_match($wish, $url)) > 0 || count(preg_match($etsy, $url)) > 0){
			$itemRequest = new Request;
			$itemRequest->url = $url;				
			}
		}
		header("Location: http://localhost/pattywhack/mvc/public/home/request");
	}



	public function parseAmazon($url){
		$url = null;
		if(isset($_POST['website']))
			$url = $_POST['website'];

		if($url != null){
			$dom = file_get_contents($url);
			//$dom->preserveWhiteSpace = FALSE;
			//libxml_use_internal_errors(true);
			//@$dom->loadHTMLFile($url);		
			//$dom->saveHTML();	
			//$title = $dom->getElementById('productTitle');
			//$price = $html->find('span#priceblock_ourprice')->plaintext;
			//$category = $html->find('a.a-link-normal a-color-tertiary')->firstChild->plaintext;
			//header("Location: http://localhost/pattywhack/mvc/public/home");
			//echo $title;
			//$url = filter_var($url, FILTER_SANITIZE_URL);

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
						var_dump($category);
						echo '</pre>';
					}
				
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


	
}
?>