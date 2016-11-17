<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Authorization extends Eloquent
{
	public $timestamp = false;
	protected $table = 'authorization';
	protected $primaryKey = 'authority_id';	
	protected $fillable = ['authority_name'];
}
?>