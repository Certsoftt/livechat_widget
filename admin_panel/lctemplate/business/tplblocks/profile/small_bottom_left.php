<?php

/*===============================================*\
|| ############################################# ||
|| # JAKWEB.CH / Version 5.0.7                 # ||
|| # ----------------------------------------- # ||
|| # Copyright 2023 JAKWEB All Rights Reserved # ||
|| ############################################# ||
\*===============================================*/

// Language file goes global
global $jkl;

/* Leave a var empty if not in use or set to false */
$wtplsett = array();

// Custom Settings
$wtplsett["chatposition"] = "bottom:0;left:0;";
$wtplsett["customjs"] = "js/profile.js";
$wtplsett["customcss"] = "";

// Only for the edit page in the operator panel
if (isset($page) && $page == "widget") {

  /* Leave a var empty if not in use or set to false */
  $profilesett = array();

  $profilesett["previewchat"] = "preview/profile.jpg";

  /* Now we need custom input fields */
  /* Following options are available:

    1. Input
    2. Textarea
    3. Radio
    4. Checkbox
    5. Select

    ***

    Title (you can use the lang vars from the operator/lang language files)

    ***

    Options (for radio 3, checkbox 4, select 5) = Green,Red,Blue
    Options (for Input) = colour or icon

    ***

    Multiple (0 = No / 1 = Yes)

    ***

    The english language var for the input field

    */

    $profilesett["formoptions"] = array("1" => "1:#:".$jkl['cw44'].":#:0:#:0:#:profile_custom_logo", "2" => "3:#:".$jkl['cw29'].":#:Yes,No:#:0:#:profile_email_required", "3" => "3:#:".$jkl['cw30'].":#:Yes,No:#:0:#:profile_phone_required", "4" => "5:#:".$jkl['cw27'].":#:blue,green,orange,red,pink,grey:#:0:#:profile_colour_theme", "5" => "5:#:".$jkl['cw28'].":#:animate__fadeIn,animate__flash,animate__pulse,animate__headShake,animate__slideInUp,animate__slideInRight:#:0:#:profile_animation");

} else {

// Check the vars for this start
$profile_animate = "animate__fadeIn";
$profile_custom = "";
$btn_custom = "blue";
$profile_logo = '<i class="fa fa fa-user-circle '.(isset($ismobile) && !empty($ismobile) ? 'fa-3x' : 'fa-4x').' jaklcb_popup_avatar" aria-hidden="true"></i>';

// We can have custom online icon
if (isset($widgetsettings['profile_animation']) && !empty($widgetsettings['profile_animation'])) {
  $profile_animate = $widgetsettings['profile_animation'];
}

// We can have custom online icon
if (isset($widgetsettings['profile_colour_theme']) && !empty($widgetsettings['profile_colour_theme']) && $widgetsettings['profile_colour_theme'] != "blue") {
  $profile_custom = " ".$widgetsettings['profile_colour_theme'];
  $btn_custom = $widgetsettings['profile_colour_theme'];
}

// We can have custom online icon
if (isset($widgetsettings['profile_custom_logo']) && !empty($widgetsettings['profile_custom_logo'])) {
  $profile_logo = '<img src="'.$widgetsettings['profile_custom_logo'].'" class="jaklcb_popup_avatar" alt="logo">';
}

// Get the languages
$allang = "";
foreach(jak_the_lang() as $k => $l) $allang .= '<option value="'.$k.'">'.$l.'</option>';
$lang_stuff = '<div class="jaklcb_select">
  <label for="profile_language">'.$jkl["g91"].'</label>
  <select name="profile_language" id="profile_language">
  '.$allang.'
  </select>
  </div>';

// We only go small in this template
$livecode = '<div id="lccontainersize" class="jak_chatopen_sm'.(isset($ismobile) ? $ismobile : '').' animate__animated '.$profile_animate.'">
<form id="lcjak_ajaxform" method="post" action="'.$_SERVER['REQUEST_URI'].'">
<button class="jaklcb_backtochat left lcb_backtochat" type="button" onclick="lcjak_smallchat(\'slideOutRight\')">
<i class="fas fa-arrow-right" aria-hidden="true"></i>
</button>
<button class="jaklcb_saveprofile left lcb_saveprofile" type="button" onclick="lcjak_saveprofile()">
<i class="fa fa-save" id="profile_save" aria-hidden="true"></i>
</button>
<button class="jaklcb_close left lcb_close" type="button" onclick="lcjak_closechat()">
<i class="fa fa-times fa-lg" aria-hidden="true"></i>
</button>
<section class="jaklcb_popup'.$profile_custom.'">
<header class="jaklcb_popup_header">
<aside style="flex:3">'.$profile_logo.'
</aside>
<aside style="flex:8">
<h1>'.$jkl['g85'].'</h1>
</aside>
</header>
<main class="jaklcb_form_main">
<div class="avatars">
<div class="ava_item">
<label>
<span><?php echo $jkl["g18"];?></span>
<input type="radio" name="avatar" value="/lctemplate/business/avatar/'.$jakwidget['avatarset'].'/standard.jpg">
<img src="'.BASE_URL.'lctemplate/business/avatar/'.$jakwidget['avatarset'].'/standard.jpg" width="50" alt="avatar">
</label>
</div>
<div class="ava_item">
<label>
<span><?php echo $jkl["g18"];?></span>
<input type="radio" name="avatar" value="/lctemplate/business/avatar/'.$jakwidget['avatarset'].'/1.jpg">
<img src="'.BASE_URL.'lctemplate/business/avatar/'.$jakwidget['avatarset'].'/1.jpg" width="50" alt="avatar">
</label>
</div>
<div class="ava_item">
<label>
<span><?php echo $jkl["g18"];?></span>
<input type="radio" name="avatar" value="/lctemplate/business/avatar/'.$jakwidget['avatarset'].'/2.jpg">
<img src="'.BASE_URL.'lctemplate/business/avatar/'.$jakwidget['avatarset'].'/2.jpg" width="50" alt="avatar">
</label>
</div>
<div class="ava_item">
<label>
<span><?php echo $jkl["g18"];?></span>
<input type="radio" name="avatar" value="/lctemplate/business/avatar/'.$jakwidget['avatarset'].'/3.jpg">
<img src="'.BASE_URL.'lctemplate/business/avatar/'.$jakwidget['avatarset'].'/3.jpg" width="50" alt="avatar">
</label>
</div>
<div class="ava_item">
<label>
<span><?php echo $jkl["g18"];?></span>
<input type="radio" name="avatar" value="/lctemplate/business/avatar/'.$jakwidget['avatarset'].'/4.jpg">
<img src="'.BASE_URL.'lctemplate/business/avatar/'.$jakwidget['avatarset'].'/4.jpg" width="50" alt="avatar">
</label>
</div>
<div class="ava_item">
<label>
<span><?php echo $jkl["g18"];?></span>
<input type="radio" name="avatar" value="/lctemplate/business/avatar/'.$jakwidget['avatarset'].'/5.jpg">
<img src="'.BASE_URL.'lctemplate/business/avatar/'.$jakwidget['avatarset'].'/5.jpg" width="50" alt="avatar">
</label>
</div>
</div>
'.$lang_stuff.'
<div class="jaklcb_input">
  <label for="name">'.$jkl["g4"].'</label>
  <input id="name" name="name" type="text" class="lcjak_input" placeholder="'.$jkl["g4"].'" value="">
</div>
<div class="jaklcb_input">
  <label for="email">'.$jkl["g5"].'</label>
  <input id="email" name="email" type="text" class="lcjak_input" placeholder="'.$jkl["g5"].'" value="">
</div>
<div class="jaklcb_input">
  <label for="phone">'.$jkl["g49"].'</label>
  <input id="phone" name="phone" type="text" class="lcjak_input" placeholder="'.$jkl["g49"].'" value="">
</div>
</main>
<input type="hidden" name="mycustomfields" value="">
</section></form></div>';

}

?>