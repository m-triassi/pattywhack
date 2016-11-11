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


	public function createUser(){
		print_r($_POST);
		$passHash = password_hash($_POST["PasswordBox"], PASSWORD_DEFAULT);
		print_r($_POST["PasswordBox"]);
		print_r($passHash);
		$newguy = User::create([
				'username' => $_POST["UsernameBox"],
				'password_hash' => $passHash, // Hash::check($_POST["password"], $hashedPassword)
				'address' => $_POST["AddressBox"],
				'postal_code'=> $_POST["PostalCodeBox"],
				'email'	=> $_POST['EmailBox']
			]);
		$newguy->save();
		/*if($newguy->isValid()){
			
			$this->index();
		}
		print_r($newguy->isValid());
		else{
			$this->register();
		}*/

		
	}


	
}
?>