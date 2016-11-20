<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class RequestURL extends Eloquent
{
	public $timestamps = false;
	protected $table = 'request';
	protected $primaryKey = 'request_id';
	protected $fillable = ['url','status_id'];
}
?>