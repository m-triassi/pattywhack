<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Question extends Eloquent
{
	public $timestamp = false;
	protected $table = 'question';
	protected $primaryKey = 'question_id';
	protected $fillable = ['username', 'question', 'status_id'];
}
?>