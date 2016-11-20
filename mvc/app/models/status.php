<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Status extends Eloquent
{
	public $timestamps = false;
	protected $table = 'status';
	protected $primaryKey = 'status_id';	
	protected $fillable = ['status_name'];
}
?>