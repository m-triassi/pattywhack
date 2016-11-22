<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Orders extends Eloquent
{
	public $timestamps = false;
	protected $table = 'orders';
	protected $primaryKey = 'order_id';	
	protected $fillable = ['username', 'date', 'total', 'budget', 'price_per_item', 'rating', 'shipping_address', 'tracking_number', 'shipping_cost', 'status_id'];
}
?>