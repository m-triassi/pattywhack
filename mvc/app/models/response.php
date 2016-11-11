<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Response extends Eloquent
{
	public $timestamp = false;
	protected $table = 'response';
	protected $primaryKey = 'response_id';	
	protected $fillable = ['question_id', 'username', 'answer'];
}
?>