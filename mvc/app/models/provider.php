<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Provider extends Eloquent
{
	public $timestamps = false;
	protected $table = 'provider';
	protected $primaryKey = 'provider_id';	
	protected $fillable = ['provider_name'];
}
?>