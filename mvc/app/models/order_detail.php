<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Order_detail extends Eloquent
{
	use Traits\HasCompositePrimaryKey;

	public $timestamps = false;
	protected $table = 'order_detail';
	protected $primaryKey = array('order_id','product_id');
	protected $fillable = ['order_id','product_id','quantity','item_price'];
}
?>