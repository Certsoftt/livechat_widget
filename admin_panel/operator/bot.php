<?php

/*===============================================*\
|| ############################################# ||
|| # JAKWEB.CH / Version 5.1                   # ||
|| # ----------------------------------------- # ||
|| # Copyright 2023 JAKWEB All Rights Reserved # ||
|| ############################################# ||
\*===============================================*/

// Check if the file is accessed only via index.php if not stop the script from running
if (!defined('JAK_ADMIN_PREVENT_ACCESS')) die('You cannot access this file directly.');

// Check if the user has access to this file
if (!jak_get_access("proactive", $jakuser->getVar("permissions"), JAK_SUPERADMINACCESS)) jak_redirect(BASE_URL);

// All the tables we need for this plugin
$errors = array();
$jaktable = 'bot_question';
$jaktable1 = 'departments';
$jaktable2 = 'chatwidget';
$jaktable3 = 'bot_chatgpt';

// Reset some vars
$totalChange = 0;
$lastChange = '';

// Now start with the plugin use a switch to access all pages
switch ($page1) {

	case 'chatgpt':

		// Let's go on with the script
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
		    $jkp = $_POST;
		    
		    if (isset($jkp['action']) && $jkp['action'] == "delete") {
		    
		    if (!JAK_USERID || !JAK_SUPERADMINACCESS) jak_redirect(BASE_URL);
		    
			    if (isset($jkp['jak_delete_bot'])) {
			    	
			    	$lockuser = $jkp['jak_delete_bot'];
			
			        for ($i = 0; $i < count($lockuser); $i++) {
			            $locked = $lockuser[$i];
			            
			            // Delete
			            $jakdb->delete($jaktable3, ["id" => $locked]);
			        	
			        }
			        
			        $_SESSION["successmsg"] = $jkl['g14'];
		    		jak_redirect($_SESSION['LCRedirect']);
			    }
			
				$_SESSION["errormsg"] = $jkl['i3'];
		    	jak_redirect($_SESSION['LCRedirect']);
		    
		    }

		    if (isset($jkp['action']) && $jkp['action'] == "status") {

	         	if (isset($jkp['jak_delete_bot'])) {
	            
		            $delartic = $jkp['jak_delete_bot'];
		      
		            for ($i = 0; $i < count($delartic); $i++) {
		              $statusu = $delartic[$i];
		              $uidacc = explode(":#:", $statusu);

		              // Update row
		              if ($uidacc[1] == 1) {
		                $jakdb->update($jaktable3, ["active" => 0], ["id" => $uidacc[0]]);
		              } else {
		                $jakdb->update($jaktable3, ["active" => 1], ["id" => $uidacc[0]]);
		              }
		                
		            }
		              
		            $_SESSION["successmsg"] = $jkl['g14'];
		            jak_redirect($_SESSION['LCRedirect']);
		        }
			}
		}

		// Get all widgets
		$JAK_WIDGETS = $jakdb->select($jaktable2, ["id", "title"], ["ORDER" => ["title" => "ASC"]]);
		 
		// Get all departments
		$JAK_DEPARTMENTS = $jakdb->select($jaktable1, ["id", "title"], ["ORDER" => ["dorder" => "ASC"]]);
		 
		// Get all AI bot messages for the chat
		$BOT_ALL = $jakdb->select($jaktable3, ["id", "question", "answer"], ["ORDER" => ["id" => "DESC"]]);

		// How often we had changes
	    $totalChange = $jakdb->count("whatslog", ["whatsid" => [115]]);

	    // Last Edit
	    if ($totalChange != 0) {
	      $lastChange = $jakdb->get("whatslog", "time", ["whatsid" => [115], "ORDER" => ["time" => "DESC"], "LIMIT" => 1]);
	    }

		// Call the settings function
		$lang_files = jak_get_lang_files();
		 
		// Title and Description
		$SECTION_TITLE = $jkl["m23"];
		$SECTION_DESC = "";
		
		// Include the javascript file for results
		$js_file_footer = 'js_chatgpt.php';
		 
		// Call the template
		$template = 'botchatgpt.php';

		switch ($page2) {

			case 'edit':

				// Check if the user exists
				if (is_numeric($page3) && jak_row_exist($page3,$jaktable3)) {
				
					if ($_SERVER['REQUEST_METHOD'] == 'POST') {
				    $jkp = $_POST;
				
				    if (empty($jkp['question'])) {
				        $errors['e'] = $jkl['e26'];
				    }
				    
				    if (empty($jkp['answer'])) {
				        $errors['e1'] = $jkl['e1'];
				    }
				    
				    if (count($errors) == 0) {

				    	// widget id's
						if (!isset($jkp['jak_widgetid']) OR in_array("0", $jkp['jak_widgetid'])) {
							$widg = 0;
						} else {
							$widg = join(',', $jkp['jak_widgetid']);
						}

				    	$result = $jakdb->update($jaktable3, ["widgetids" => $widg,
				    		"depid" => $jkp['jak_depid'],
							"lang" => $jkp['jak_lang'],
							"question" => $jkp['question'],
							"answer" => $jkp['answer'],
							"updated" => $jakdb->raw("NOW()")], ["id" => $page3]);
				
						if (!$result) {
						    $_SESSION["infomsg"] = $jkl['i'];
				    		jak_redirect($_SESSION['LCRedirect']);
						} else {

							// Write the log file each time someone tries to login before
		          			JAK_base::jakWhatslog('', JAK_USERID, 0, 99, $page2, (isset($_COOKIE['WIOgeoData']) ? $_COOKIE['WIOgeoData'] : ''), $jakuser->getVar("username"), $_SERVER['REQUEST_URI'], $ipa, $valid_agent);
							
						    $_SESSION["successmsg"] = $jkl['g14'];
				    		jak_redirect($_SESSION['LCRedirect']);
						}
				
					// Output the errors
					} else {
					
					    $errors = $errors;
					}
					
					}

					// Get all widgets
					$JAK_WIDGETS = $jakdb->select($jaktable2, ["id", "title"], ["ORDER" => ["title" => "ASC"]]);
				
					// Get all departments
					$JAK_DEPARTMENTS = $jakdb->select($jaktable1, ["id", "title"], ["ORDER" => ["dorder" => "ASC"]]);

					// Call the settings function
					$lang_files = jak_get_lang_files();
				
					$JAK_FORM_DATA = jak_get_data($page3, $jaktable3);
					
					// Title and Description
					$SECTION_TITLE = $jkl["m32"];
					$SECTION_DESC = "";
					
					$template = 'editbot.php';
				
				} else {
				    
				   	$_SESSION["errormsg"] = $jkl['i3'];
				    jak_redirect(JAK_rewrite::jakParseurl('bot', 'chatgpt'));
				}

			break;

			case 'truncate':
  	
		  		if (!JAK_USERID || !JAK_SUPERADMINACCESS) jak_redirect(BASE_URL);
		  		
		  		$jakdb->query('TRUNCATE '.JAKDB_PREFIX.$jaktable3);
		  	    
			  	if (!$result) {
			  		$_SESSION["infomsg"] = $jkl['i'];
				    jak_redirect(JAK_rewrite::jakParseurl('bot', 'chatgpt'));
			  	} else {
			  	    $_SESSION["successmsg"] = $jkl['g14'];
				    jak_redirect(JAK_rewrite::jakParseurl('bot', 'chatgpt'));
			  	}
			  	 
		  	break;

		}


	break;

	case 'delete':
		 
		// Check if user exists and can be deleted
		if (is_numeric($page2)) {
		        
			// Now check how many languages are installed and do the dirty work
			$result = $jakdb->delete($jaktable, ["id" => $page2]);
		
			if (!$result) {
			    $_SESSION["infomsg"] = $jkl['i'];
		    	jak_redirect($_SESSION['LCRedirect']);
			} else {
				
				// Now let us delete the define cache file
				$cachestufffile = APP_PATH.JAK_CACHE_DIRECTORY.'/stuff.php';
				if (file_exists($cachestufffile)) {
					unlink($cachestufffile);
				}

				// Write the log file each time someone tries to login before
          		JAK_base::jakWhatslog('', JAK_USERID, 0, 78, $page2, (isset($_COOKIE['WIOgeoData']) ? $_COOKIE['WIOgeoData'] : ''), $jakuser->getVar("username"), $_SERVER['REQUEST_URI'], $ipa, $valid_agent);
				
			    $_SESSION["successmsg"] = $jkl['g14'];
		    	jak_redirect($_SESSION['LCRedirect']);
			}
		    
		} else {
		   	$_SESSION["errormsg"] = $jkl['i3'];
		    jak_redirect($_SESSION['LCRedirect']);
		}
		
	break;
	case 'edit':
	
		// Check if the user exists
		if (is_numeric($page2) && jak_row_exist($page2,$jaktable)) {
		
			if ($_SERVER['REQUEST_METHOD'] == 'POST') {
		    $jkp = $_POST;
		
		    if (empty($jkp['question'])) {
		        $errors['e'] = $jkl['e26'];
		    }
		    
		    if (empty($jkp['answer'])) {
		        $errors['e1'] = $jkl['e1'];
		    }
		    
		    if (count($errors) == 0) {

		    	// widget id's
				if (!isset($jkp['jak_widgetid']) OR in_array("0", $jkp['jak_widgetid'])) {
					$widg = 0;
				} else {
					$widg = join(',', $jkp['jak_widgetid']);
				}

		    	$result = $jakdb->update($jaktable, ["widgetids" => $widg,
		    		"depid" => $jkp['jak_depid'],
					"lang" => $jkp['jak_lang'],
					"question" => strtolower($jkp['question']),
					"answer" => $jkp['answer'],
					"updated" => $jakdb->raw("NOW()")], ["id" => $page2]);
		
				if (!$result) {
				    $_SESSION["infomsg"] = $jkl['i'];
		    		jak_redirect($_SESSION['LCRedirect']);
				} else {
					
					// Now let us delete the define cache file
					$cachestufffile = APP_PATH.JAK_CACHE_DIRECTORY.'/stuff.php';
					if (file_exists($cachestufffile)) {
						unlink($cachestufffile);
					}

					// Write the log file each time someone tries to login before
          			JAK_base::jakWhatslog('', JAK_USERID, 0, 76, $page2, (isset($_COOKIE['WIOgeoData']) ? $_COOKIE['WIOgeoData'] : ''), $jakuser->getVar("username"), $_SERVER['REQUEST_URI'], $ipa, $valid_agent);
					
				    $_SESSION["successmsg"] = $jkl['g14'];
		    		jak_redirect($_SESSION['LCRedirect']);
				}
		
			// Output the errors
			} else {
			
			    $errors = $errors;
			}
			
			}

			// Get all widgets
			$JAK_WIDGETS = $jakdb->select($jaktable2, ["id", "title"], ["ORDER" => ["title" => "ASC"]]);

			// Get all departments
			$JAK_DEPARTMENTS = $jakdb->select($jaktable1, ["id", "title"], ["ORDER" => ["dorder" => "ASC"]]);

			// Call the settings function
			$lang_files = jak_get_lang_files();
		
			$JAK_FORM_DATA = jak_get_data($page2, $jaktable);
			
			// Title and Description
			$SECTION_TITLE = $jkl["m24"];
			$SECTION_DESC = "";
			
			$template = 'editbot.php';
		
		} else {
		    
		   	$_SESSION["errormsg"] = $jkl['i3'];
		    jak_redirect(JAK_rewrite::jakParseurl('bot'));
		}
		
	break;
	default:
		
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['insert_bot'])) {
		    $jkp = $_POST;
		    
		    if (empty($jkp['question'])) {
		            $errors['e'] = $jkl['e26'];
		        }
		        
		        if (empty($jkp['answer'])) {
		            $errors['e1'] = $jkl['e1'];
		        }
		        
		        if (count($errors) == 0) {

		        	// widget id's
					if (!isset($jkp['jak_widgetid']) OR in_array("0", $jkp['jak_widgetid'])) {
						$widg = 0;
					} else {
						$widg = join(',', $jkp['jak_widgetid']);
					}

		        	$jakdb->insert($jaktable, ["widgetids" => $widg,
		        		"depid" => $jkp['jak_depid'],
						"lang" => $jkp['jak_lang'],
						"question" => strtolower($jkp['question']),
						"answer" => $jkp['answer'],
						"updated" => $jakdb->raw("NOW()"),
						"created" => $jakdb->raw("NOW()")]);

					$lastid = $jakdb->id();
		    
		    		if (!$lastid) {
		    		    $_SESSION["infomsg"] = $jkl['i'];
		    			jak_redirect($_SESSION['LCRedirect']);
		    		} else {
		    			
		    			// Now let us delete the define cache file
		    			$cachestufffile = APP_PATH.JAK_CACHE_DIRECTORY.'/stuff.php';
		    			if (file_exists($cachestufffile)) {
		    				unlink($cachestufffile);
		    			}

		    			// Write the log file each time someone tries to login before
          				JAK_base::jakWhatslog('', JAK_USERID, 0, 77, $lastid, (isset($_COOKIE['WIOgeoData']) ? $_COOKIE['WIOgeoData'] : ''), $jakuser->getVar("username"), $_SERVER['REQUEST_URI'], $ipa, $valid_agent);
		    			
		    		    $_SESSION["successmsg"] = $jkl['g14'];
		    			jak_redirect($_SESSION['LCRedirect']);
		    		}
		    
		    // Output the errors
		    } else {
		    
		        $errors = $errors;
		    }
		    
   
		 }

		// Get all widgets
		$JAK_WIDGETS = $jakdb->select($jaktable2, ["id", "title"], ["ORDER" => ["title" => "ASC"]]);
		 
		// Get all departments
		$JAK_DEPARTMENTS = $jakdb->select($jaktable1, ["id", "title"], ["ORDER" => ["dorder" => "ASC"]]);
		 
		// Get all bot messages for the chat
		$BOT_ALL = $jakdb->select($jaktable, ["id", "question", "answer"], ["ORDER" => ["id" => "DESC"]]);

		// How often we had changes
	    $totalChange = $jakdb->count("whatslog", ["whatsid" => [76,77,78]]);

	    // Last Edit
	    if ($totalChange != 0) {
	      $lastChange = $jakdb->get("whatslog", "time", ["whatsid" => [76,77,78], "ORDER" => ["time" => "DESC"], "LIMIT" => 1]);
	    }

		// Call the settings function
		$lang_files = jak_get_lang_files();
		 
		// Title and Description
		$SECTION_TITLE = $jkl["m23"];
		$SECTION_DESC = "";
		
		// Include the javascript file for results
		$js_file_footer = 'js_pages.php';
		 
		// Call the template
		$template = 'bot.php';
}
?>