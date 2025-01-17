<?php

/*===============================================*\
|| ############################################# ||
|| # JAKWEB.CH / Version 5.1.2                 # ||
|| # ----------------------------------------- # ||
|| # Copyright 2024 JAKWEB All Rights Reserved # ||
|| ############################################# ||
\*===============================================*/

// Check if the file is accessed only via index.php if not stop the script from running
if (!defined('JAK_ADMIN_PREVENT_ACCESS')) die('You cannot access this file directly.');

// Check if the user has access to this file
if (!jak_get_access("widget", $jakuser->getVar("permissions"), JAK_SUPERADMINACCESS)) jak_redirect(BASE_URL);

// All the tables we need for this plugin
$errors = array();
$jaktable = 'chatwidget';
$jaktable1 = 'departments';
$jaktable2 = 'user';
$jaktable3 = 'chatsettings';

// We reset some vars
$newwidg = true;
$totalChange = 0;
$lastChange = '';

// Now start with the plugin use a switch to access all pages
switch ($page1) {

	case 'delete':
		 
		// Check if user exists and can be deleted
		if (is_numeric($page2) && $page2 != 1) {
		        
			// Now check how many languages are installed and do the dirty work
			$result = $jakdb->delete($jaktable, ["id" => $page2]);
		
		if (!$result) {

		    $_SESSION["infomsg"] = $jkl['i'];
		    jak_redirect($_SESSION['LCRedirect']);
		} else {

			// Now let us delete the widget cache file
	        $cachewidget = APP_PATH.JAK_CACHE_DIRECTORY.'/widget'.$page2.'.php';
	        if (file_exists($cachewidget)) {
	            unlink($cachewidget);
	        }

	        // Write the log file each time someone login after to show success
    		JAK_base::jakWhatslog('', JAK_USERID, 0, 33, $page2, (isset($_COOKIE['WIOgeoData']) ? $_COOKIE['WIOgeoData'] : ''), $jakuser->getVar("username"), $_SERVER['REQUEST_URI'], $ipa, $valid_agent);

		    $_SESSION["successmsg"] = $jkl['g14'];
		    jak_redirect($_SESSION['LCRedirect']);
		}
		    
		} else {

		   	$_SESSION["errormsg"] = $jkl['i3'];
		    jak_redirect($_SESSION['LCRedirect']);
		}
		
	break;
	case 'edit':
	
		if(is_numeric($page2)&&jak_row_exist($page2,$jaktable)){if($_SERVER['REQUEST_METHOD']=='POST'){$jkp=$_POST;if(empty($jkp['title'])){$errors['e']=$jkl['e2'];}
		if(count($errors)==0){if((!isset($jkp['jak_depid'])||$jkp['jak_depid']==0)||(is_array($jkp['jak_depid'])&&in_array("0",$jkp['jak_depid']))){$depa=0;}else{$depa=join(',',$jkp['jak_depid']);}
		include_once'../include/htmlawed.php';$htmlconfig=array('comment'=>0,'cdata'=>1,'elements'=>'a, strong');$dsgvo_clean=htmLawed($_REQUEST['jak_dsgvo'],$htmlconfig);$result=$jakdb->update($jaktable,["title"=>$jkp['title'],"depid"=>$depa,"opid"=>$jkp['jak_opid'],"lang"=>$jkp['jak_lang'],"feedback"=>$jkp['jak_feedback'],"hidewhenoff"=>$jkp['jak_hidewhenoff'],"onlymembers"=>$jkp['jak_onlymembers'],"chatgpt"=>$jkp['jak_chatgpt'],"chatgpt_helpful"=>$jkp['jak_chatgpt_helpful'],"redirect_active"=>$jkp['redirect_active'],"redirect_url"=>$jkp['url_red'],"redirect_after"=>$jkp['jak_redi_contact'],"dsgvo"=>$dsgvo_clean,"template"=>$jkp['chatSty'],"avatarset"=>$jkp['avatarset'],"btn_tpl"=>$jkp['jak_btn_tpl'],"start_tpl"=>$jkp['jak_start_tpl'],"chat_tpl"=>$jkp['jak_chat_tpl'],"contact_tpl"=>$jkp['jak_contact_tpl'],"profile_tpl"=>$jkp['jak_profile_tpl'],"feedback_tpl"=>$jkp['jak_feedback_tpl']],["id"=>$page2]);if(!$result){$_SESSION["infomsg"]=$jkl['i'];jak_redirect($_SESSION['LCRedirect']);}else{if(isset($jkp['chatsettings'])&&!empty($jkp['chatsettings'])){foreach($jkp['chatsettings']as $v){$fvstore=explode(":#:",$v);if($jakdb->has($jaktable3,["AND"=>["widgetid"=>$page2,"template"=>$jkp['chatSty'],"formtype"=>$fvstore[1],"settname"=>$fvstore[0]]])){$jakdb->update($jaktable3,["settvalue"=>jak_widget_settings($jkp[$fvstore[0]]),"updated"=>$jakdb->raw("NOW()")],["AND"=>["widgetid"=>$page2,"template"=>$jkp['chatSty'],"formtype"=>$fvstore[1],"settname"=>$fvstore[0]]]);}else{if(isset($jkp[$fvstore[0]])&&!empty($jkp[$fvstore[0]])){$jakdb->insert($jaktable3,["widgetid"=>$page2,"template"=>$jkp['chatSty'],"formtype"=>$fvstore[1],"lang"=>JAK_LANG,"settname"=>$fvstore[0],"settvalue"=>jak_widget_settings($jkp[$fvstore[0]]),"updated"=>$jakdb->raw("NOW()"),"created"=>$jakdb->raw("NOW()")]);}}}}
		if(isset($jkp['jak_btn_tpl'])&&!empty($jkp['jak_btn_tpl'])&&isset($jkp['jak_btn_tpl_old'])&&!empty($jkp['jak_btn_tpl_old'])&&$jkp['jak_btn_tpl']!=$jkp['jak_btn_tpl_old']){jak_remove_chat_options("btn_form",$page2);$btn_config=APP_PATH.'lctemplate/'.$jkp['chatSty'].'/tplblocks/btn/'.$jkp['jak_btn_tpl'];if(file_exists($btn_config))include_once $btn_config;if(isset($wtplsett["standardvars"])&&is_array($wtplsett["standardvars"])){foreach($wtplsett["standardvars"]as $k=>$v){$jakdb->insert($jaktable3,["widgetid"=>$page2,"template"=>$jkp['chatSty'],"formtype"=>"btn_form","lang"=>JAK_LANG,"settname"=>$k,"settvalue"=>jak_widget_settings($v),"updated"=>$jakdb->raw("NOW()"),"created"=>$jakdb->raw("NOW()")]);}}}
		if(isset($jkp['jak_start_tpl'])&&!empty($jkp['jak_start_tpl'])&&isset($jkp['jak_start_tpl_old'])&&!empty($jkp['jak_start_tpl_old'])&&$jkp['jak_start_tpl']!=$jkp['jak_start_tpl_old']){jak_remove_chat_options("start_form",$page2);}
		if(isset($jkp['jak_chat_tpl'])&&!empty($jkp['jak_chat_tpl'])&&isset($jkp['jak_chat_tpl_old'])&&!empty($jkp['jak_chat_tpl_old'])&&$jkp['jak_chat_tpl']!=$jkp['jak_chat_tpl_old']){jak_remove_chat_options("chat_form",$page2);}
		if(isset($jkp['jak_contact_tpl'])&&!empty($jkp['jak_contact_tpl'])&&isset($jkp['jak_contact_tpl_old'])&&!empty($jkp['jak_contact_tpl_old'])&&$jkp['jak_contact_tpl']!=$jkp['jak_contact_tpl_old']){jak_remove_chat_options("contact_form",$page2);}
		if(isset($jkp['jak_profile_tpl'])&&!empty($jkp['jak_profile_tpl'])&&isset($jkp['jak_profile_tpl_old'])&&!empty($jkp['jak_profile_tpl_old'])&&$jkp['jak_profile_tpl']!=$jkp['jak_profile_tpl_old']){jak_remove_chat_options("profile_form",$page2);}
		if(isset($jkp['jak_feedback_tpl'])&&!empty($jkp['jak_feedback_tpl'])&&isset($jkp['jak_feedback_tpl_old'])&&!empty($jkp['jak_feedback_tpl_old'])&&$jkp['jak_feedback_tpl']!=$jkp['jak_feedback_tpl_old']){jak_remove_chat_options("feedback_form",$page2);}
		$cacheallfiles=APP_PATH.JAK_CACHE_DIRECTORY.'/';$msfi=glob($cacheallfiles."*.php");if($msfi)foreach($msfi as $filen){if(file_exists($filen))unlink($filen);}
		JAK_base::jakWhatslog('',JAK_USERID,0,18,$page2,(isset($_COOKIE['WIOgeoData'])?$_COOKIE['WIOgeoData']:''),$jakuser->getVar("username"),$_SERVER['REQUEST_URI'],$ipa,$valid_agent);$_SESSION["successmsg"]=$jkl['g14'];jak_redirect($_SESSION['LCRedirect']);}}else{$errors=$errors;}}
		require_once'../class/class.jaklic.php';$jakCheck=new JAKCheckAPI();$SECTION_TITLE=$jkl["g290"];$SECTION_DESC="";$JAK_DEPARTMENTS=$jakdb->select($jaktable1,["id","title"],["ORDER"=>["dorder"=>"ASC"]]);$JAK_OPERATORS=$jakdb->select($jaktable2,["id","username"],["ORDER"=>["username"=>"ASC"]]);$lang_files=jak_get_lang_files();$chat_templates=jak_get_chat_templates();$BUTTONS_ALL=jak_get_files(APP_PATH.JAK_FILES_DIRECTORY.'/buttons');$SLIDEIMG_ALL=jak_get_files(APP_PATH.JAK_FILES_DIRECTORY.'/slideimg');$JAK_FORM_DATA=jak_get_data($page2,$jaktable);if(isset($JAK_FORM_DATA['template'])&&!empty($JAK_FORM_DATA['template'])){$btn_tpl=jak_get_templates_files(APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/btn/');$start_tpl=jak_get_templates_files(APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/start/');$chat_tpl=jak_get_templates_files(APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/chat/');$contact_tpl=jak_get_templates_files(APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/contact/');$profile_tpl=jak_get_templates_files(APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/profile/');$feedback_tpl=jak_get_templates_files(APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/feedback/');}
		if(isset($JAK_FORM_DATA["btn_tpl"])&&!empty($JAK_FORM_DATA['btn_tpl'])){$btn_config=APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/btn/'.$JAK_FORM_DATA['btn_tpl'];if(file_exists($btn_config))include_once $btn_config;$btn_form=jak_get_custom_fields($page2,$JAK_FORM_DATA['template'],"btn_form",$btnsett["formoptions"],$BUTTONS_ALL,$SLIDEIMG_ALL);}
		if(!jak_get_important_data($ipa)){$jakCheck->deactivate_license();jak_redirect(JAK_rewrite::jakParseurl('maintenance'));}
		if(isset($JAK_FORM_DATA["start_tpl"])&&!empty($JAK_FORM_DATA['start_tpl'])){$start_config=APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/start/'.$JAK_FORM_DATA['start_tpl'];if(file_exists($start_config))include_once $start_config;$start_form=jak_get_custom_fields($page2,$JAK_FORM_DATA['template'],"start_form",$startsett["formoptions"],"","");}
		if(isset($JAK_FORM_DATA["chat_tpl"])&&!empty($JAK_FORM_DATA['chat_tpl'])){$chat_config=APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/chat/'.$JAK_FORM_DATA['chat_tpl'];if(file_exists($chat_config))include_once $chat_config;$chat_form=jak_get_custom_fields($page2,$JAK_FORM_DATA['template'],"chat_form",$chatsett["formoptions"],"","");}
		if(isset($JAK_FORM_DATA["contact_tpl"])&&!empty($JAK_FORM_DATA['contact_tpl'])){$contact_config=APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/contact/'.$JAK_FORM_DATA['contact_tpl'];if(file_exists($contact_config))include_once $contact_config;$contact_form=jak_get_custom_fields($page2,$JAK_FORM_DATA['template'],"contact_form",$contactsett["formoptions"],"","");}
		if(isset($JAK_FORM_DATA["profile_tpl"])&&!empty($JAK_FORM_DATA['profile_tpl'])){$profile_config=APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/profile/'.$JAK_FORM_DATA['profile_tpl'];if(file_exists($profile_config))include_once $profile_config;$profile_form=jak_get_custom_fields($page2,$JAK_FORM_DATA['template'],"profile_form",$profilesett["formoptions"],"","");}
		if(isset($JAK_FORM_DATA["feedback_tpl"])&&!empty($JAK_FORM_DATA['feedback_tpl'])){$feedback_config=APP_PATH.'lctemplate/'.$JAK_FORM_DATA['template'].'/tplblocks/feedback/'.$JAK_FORM_DATA['feedback_tpl'];if(file_exists($feedback_config))include_once $feedback_config;$feedback_form=jak_get_custom_fields($page2,$JAK_FORM_DATA['template'],"feedback_form",$feedbacksett["formoptions"],"","");}
		$avatar_sets=jak_get_avatar_sets($JAK_FORM_DATA['template']);$avatar_images=jak_get_avatar_images($JAK_FORM_DATA['template'],$JAK_FORM_DATA['avatarset']);$js_file_footer='js_editwidget.php';$template='editwidget.php';}else{$_SESSION["errormsg"]=$jkl['i3'];jak_redirect($_SESSION['LCRedirect']);}
		
	break;
	default:
		
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['create_widget'])) {
		    $jkp = $_POST;

		    // Hosting is active we need to count the total operators
			if ($jakhs['hostactive']) {
				$totalwidg = $jakdb->count($jaktable);

				if ($totalwidg >= $jakhs['chatwidgets']) {
					$_SESSION["errormsg"] = $jkl['i6'];
		    		jak_redirect($_SESSION['LCRedirect']);
				}
			}
		    
		    if (empty($jkp['title'])) {
		        $errors['e'] = $jkl['e2'];
		    }
		        
		   	if (count($errors) == 0) {

		   		// Chat departments
                if ((!isset($jkp['jak_depid']) || $jkp['jak_depid'] == 0) || (is_array($jkp['jak_depid']) && in_array("0", $jkp['jak_depid']))) {
                    $depa = 0;
                } else {
                    $depa = join(',', $jkp['jak_depid']);
                }

		        $jakdb->insert($jaktable, ["title" => $jkp['title'],
					"depid" => $depa,
					"opid" => $jkp['jak_opid'],
					"lang" => $jkp['jak_lang'],
					"created" => $jakdb->raw("NOW()")]);

		        $lastid = $jakdb->id();

		    	if (!$lastid) {
		    		$_SESSION["infomsg"] = $jkl['i'];
		    		jak_redirect($_SESSION['LCRedirect']);
		    	} else {

		    		// Write the log file each time someone login after to show success
    				JAK_base::jakWhatslog('', JAK_USERID, 0, 17, $lastid, (isset($_COOKIE['WIOgeoData']) ? $_COOKIE['WIOgeoData'] : ''), $jakuser->getVar("username"), $_SERVER['REQUEST_URI'], $ipa, $valid_agent);

		    		$_SESSION["successmsg"] = $jkl['g14'];
		    		jak_redirect($_SESSION['LCRedirect']);
		    	}
		    
		    // Output the errors
		    } else {
		    
		        $errors = $errors;
		    }  
   
		 }
		 
		// Get all departments
		$JAK_DEPARTMENTS = $jakdb->select($jaktable1, ["id", "title"], ["ORDER" => ["dorder" => "ASC"]]);

		// Get all operators
		$JAK_OPERATORS = $jakdb->select($jaktable2, ["id", "username"], ["ORDER" => ["username" => "ASC"]]);

		// Call the settings function
		$lang_files = jak_get_lang_files();
		
		// Get all responses
		$CHATWIDGET_ALL = jak_get_page_info($jaktable);

		// How often we had changes
		$totalChange = $jakdb->count("whatslog", ["whatsid" => [17,18,33]]);

		// Last Edit
		if ($totalChange != 0) {
			$lastChange = $jakdb->get("whatslog", "time", ["whatsid" => [17,18,33], "ORDER" => ["time" => "DESC"], "LIMIT" => 1]);
		}
		
		// Hosting is active we need to count the total widgets
		if ($jakhs['hostactive']) {
			$totalwidg = $jakdb->count($jaktable);
			if ($totalwidg >= $jakhs['chatwidgets']) $newwidg = false;
		}
		
		// Title and Description
		$SECTION_TITLE = $jkl["m26"];
		$SECTION_DESC = "";
		
		// Include the javascript file for results
		$js_file_footer = 'js_widget.php';
		 
		// Call the template
		$template = 'widget.php';
}
?>