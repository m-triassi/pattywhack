<?php
session_start();
require_once '../vendor/autoload.php';
require_once 'database.php';
require_once 'core/App.php';
require_once 'core/Controller.php';
require_once 'core/simple_html_dom.php';

define('SITE_URL', 'localhost/pattywhack/mvc/public/home/confirmOrder');

$paypal = new \Paypal\Rest\ApiContext(
	new \Paypal\Auth\OAuthToken\Credential(
		'ARxUXJHH5K43BUp-u39mPXfW-mfAxahfbSkEyPMzLVXDDkhoIFiNtL7ET4WMvx0ly4e8jVm-MP5fXusP',
		'EGd8S6WcqLROCZc-UOYAdsxbD0V1Ncyz-0QwEtNIn-8ZPVFCLCc8TMBud_9BAiKTGU9OrUDIUsF_onm0'
		 )
	);

?>
