<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Preference_detail extends Eloquent
{
	use Traits\HasCompositePrimaryKey;

	public $timestamp = false;
	protected $table = 'preference_detail';
	protected $primaryKey = array('username','preference_id');
	protected $fillable = ['username','preference_id'];
}
?>