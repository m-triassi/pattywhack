<?php
session_start();

use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;

require __dir__ .'/../vendor/autoload.php';
require_once 'database.php';
require_once 'core/App.php';
require_once 'core/Controller.php';
require_once 'core/simple_html_dom.php';


define('SITE_URL', 'localhost/pattywhack/mvc/public/home/confirmOrder');

$paypal = new ApiContext(
	new OAuthTokenCredential(
		'ARxUXJHH5K43BUp-u39mPXfW-mfAxahfbSkEyPMzLVXDDkhoIFiNtL7ET4WMvx0ly4e8jVm-MP5fXusP',
		'EGd8S6WcqLROCZc-UOYAdsxbD0V1Ncyz-0QwEtNIn-8ZPVFCLCc8TMBud_9BAiKTGU9OrUDIUsF_onm0'
		 )
	);

	$paypal->setConfig([
			'mode' => 'sandbox',
			'http.Connection_TimeOut' => 30,
			'log.LogEnable' => false,
			'log.FileName' => 'log.txt',
			'log.LogLevel' => 'Fine',
			'validation.level' => 'log'
		]);



?>
