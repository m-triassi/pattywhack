<?php 
use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule();

$capsule->addConnection([
	'driver' => 'mysql',
	'host' => 'localhost',
	'username' => 'RandomUser',
	'password' => 'thisispatty',
	'database' => 'pattydb',
	'charset' => 'utf8',
	'collation' => 'utf8_unicode_ci',
	'prefix' => ''
	]);

//$capsule->setAsGlobal();

$capsule->bootEloquent();
?>