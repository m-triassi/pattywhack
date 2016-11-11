<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Request extends Eloquent
{
	public $timestamp = false;
	protected $table = 'request';
	protected $primaryKey = 'request_id';
	protected $fillable = ['url', 'status_id'];
}
?>