<?php 
use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule();

$capsule->addConnection([
	'driver' => 'mysql',
	'host' => 'localhost',
	'username' => 'RandomUser',
	'password' => 'GAtvN2yKA7wFGxyW',
	'database' => 'pattydb',
	'charset' => 'utf8',
	'collation' => 'utf8_unicode_ci',
	'prefix' => ''
	]);

//$capsule->setAsGlobal();

$capsule->bootEloquent();
?>