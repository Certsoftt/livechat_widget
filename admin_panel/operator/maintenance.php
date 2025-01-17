<?php

/*===============================================*\
|| ############################################# ||
|| # JAKWEB.CH / Version 5.1.2                 # ||
|| # ----------------------------------------- # ||
|| # Copyright 2024 JAKWEB All Rights Reserved # ||
|| ############################################# ||
\*===============================================*/

if (!defined('JAK_ADMIN_PREVENT_ACCESS')) die('You cannot access this file directly.');
if (!jak_get_access("maintenance", $jakuser->getVar("permissions"), JAK_SUPERADMINACCESS)) jak_redirect(BASE_URL);
require_once'../class/class.jaklic.php';
$jakCheck = new JAKCheckAPI();
$verify_response = $jakCheck->verify_license(false);
$licmsg = $verify_response['message'];
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$jkp = $_POST;
	if (isset($jkp['delCache'])) {
		$cacheallfiles = APP_PATH . JAK_CACHE_DIRECTORY . '/';
		$msfi = glob($cacheallfiles . "*.php");
		if ($msfi)
		foreach ($msfi as $filen) {
			if (file_exists($filen)) unlink($filen);
		}
		$msfipr = glob($cacheallfiles . "livepreview*.txt");
		if ($msfipr)
		foreach ($msfipr as $fileprev) {
			if (file_exists($fileprev)) unlink($fileprev);
		}
		if (file_exists($cacheallfiles . 'chats.txt')) unlink($cacheallfiles . 'chats.txt');
		JAK_base::jakWhatslog(
			'',
			JAK_USERID,
			0,
			10,
			0,
			(isset($_COOKIE['WIOgeoData']) ? $_COOKIE['WIOgeoData'] : ''),
			$jakuser->getVar("username"),
			$_SERVER['REQUEST_URI'],
			$ipa,
			$valid_agent
		);
		$_SESSION["successmsg"] = $jkl['g14'];
		jak_redirect(JAK_rewrite::jakParseurl('maintenance'));
	}
	if (isset($jkp['delTokens'])) {
		$result = $jakdb->query('TRUNCATE ' . JAKDB_PREFIX . 'push_notification_devices');
		if (!$result) {
			$_SESSION["infomsg"] = $jkl['i'];
			jak_redirect($_SESSION['LCRedirect']);
		} else {
			JAK_base::jakWhatslog(
				'',
				JAK_USERID,
				0,
				15,
				0,
				(isset($_COOKIE['WIOgeoData']) ? $_COOKIE['WIOgeoData'] : ''),
				$jakuser->getVar("username"),
				$_SERVER['REQUEST_URI'],
				$ipa,
				$valid_agent
			);
			$_SESSION["successmsg"] = $jkl['g14'];
			jak_redirect(JAK_rewrite::jakParseurl('maintenance'));
		}
	}
	if (isset($jkp['optimize'])) {
		$tables = $jakdb->query('SHOW TABLES')->fetchAll();
		foreach ($tables as $db => $tablename) {
			$jakdb->query('OPTIMIZE TABLE ' . $tablename);
		}
		JAK_base::jakWhatslog(
			'',
			JAK_USERID,
			0,
			11,
			0,
			(isset($_COOKIE['WIOgeoData']) ? $_COOKIE['WIOgeoData'] : ''),
			$jakuser->getVar("username"),
			$_SERVER['REQUEST_URI'],
			$ipa,
			$valid_agent
		);
		$_SESSION["successmsg"] = $jkl['g14'];
		jak_redirect(JAK_rewrite::jakParseurl('maintenance'));
	}
	if (isset($jkp['regLicense'])) {
		if (!empty($_POST['jak_lic']) && !empty($_POST['jak_licusr'])) {
			$oNumber = filter_var(trim($_POST["jak_lic"]), FILTER_SANITIZE_FULL_SPECIAL_CHARS);
			$oUname = filter_var(trim($_POST["jak_licusr"]), FILTER_SANITIZE_FULL_SPECIAL_CHARS);
			$activate_response = $jakCheck->activate_license($oNumber, $oUname);
			if (empty($activate_response)) {
				$errors['e1'] = LB_TEXT_CONNECTION_FAILED;
			}
			if ($activate_response['status'] != true) {
				$errors['e1'] = $activate_response['message'];
			} else {
				$jakdb->update("settings", ["used_value" => $oNumber], ["varname" => "o_number"]);
				$jakdb->update("settings", ["used_value" => $oUname], ["varname" => "o_uname"]);
				$cacheallfiles = APP_PATH . JAK_CACHE_DIRECTORY . '/';
				$msfi = glob($cacheallfiles . "*.php");
				if ($msfi)
				foreach ($msfi as $filen) {
					if (file_exists($filen)) unlink($filen);
				}
				$_SESSION["successmsg"] = $jkl['g14'];
				jak_redirect(JAK_rewrite::jakParseurl('maintenance'));
			}
		} else {
			$errors['e1'] = $jkl['e28'];
			$errors['e2'] = $jkl['e8'];
		}
	}
	if (isset($jkp['deregLicense']) && JAK_SUPERADMINACCESS) {
		$deactivate_response = $jakCheck->deactivate_license();
		if (empty($deactivate_response)) {
			$errors['e1'] = LB_TEXT_CONNECTION_FAILED;
		}
		if ($deactivate_response['status'] != true) {
			$errors['e1'] = $deactivate_response['message'];
		} else {
			$_SESSION["successmsg"] = $jkl['g14'];
			jak_redirect(JAK_rewrite::jakParseurl('maintenance'));
		}
	}
}
$totalPND = $totalFiles = 0;
$totalPND = $jakdb->count("push_notification_devices");
$totalFiles = new RecursiveIteratorIterator(new RecursiveDirectoryIterator(APP_PATH . JAK_FILES_DIRECTORY), RecursiveIteratorIterator::SELF_FIRST);
$SECTION_TITLE = $jkl["m19"];
$SECTION_DESC = "";
$template = 'maintenance.php';

