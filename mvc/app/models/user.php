<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class User extends Eloquent
{
	
	/*public $username;
	public $password_hash;
	public $address;
	public $postal_code;
	public $email;
	public $authority_id;*/
	public $timestamps = false;
	protected $table = 'user';
	protected $primaryKey = 'username';

	
	protected $fillable = ['username', 'password_hash', 'address' , 'postal_code', 'email'];

	public function isValid(){
		$valid = true;
		if(!filter_var($this->email, FILTER_VALIDATE_EMAIL))
			$valid = false;
		return $valid;
	}
}
?>