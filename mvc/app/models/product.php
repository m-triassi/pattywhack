<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Product extends Eloquent
{
	public $timestamp = false;
	protected $table = 'product';
	protected $primaryKey = 'product_id';
	protected $fillable = ['product_name', 'url', 'unit_price', 'product_size', 'item_shipping_cost', 'availability', 'category_id', 'provider_id'];
}
?>