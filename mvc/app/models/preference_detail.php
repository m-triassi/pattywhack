<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Preference_detail extends Eloquent
{
	

	public $timestamps = false;
	protected $table = 'preference_detail';
	protected $primaryKey = 'pref_table_id';
	protected $fillable = ['username','preference_id'];
}
?>