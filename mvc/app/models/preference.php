<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Preference extends Eloquent
{
	public $timestamp = false;
	protected $table = 'preference';
	protected $primaryKey = 'preference_id';
	protected $fillable = ['preference_category'];
}
?>