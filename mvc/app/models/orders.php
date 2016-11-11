<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Orders extends Eloquent
{
	public $timestamp = false;
	protected $table = 'orders';
	protected $primaryKey = 'order_id';	
	protected $fillable = ['order_id', 'username', 'date', 'total', 'budget', 'price_per_item', 'rating', 'shipping_address', 'tracking_number', 'shipping_cost', 'status_id'];
}
?>