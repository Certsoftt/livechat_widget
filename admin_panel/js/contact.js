/*===============================================*\
|| ############################################# ||
|| # JAKWEB.CH / Version 5.1.2                 # ||
|| # ----------------------------------------- # ||
|| # Copyright 2024 JAKWEB All Rights Reserved # ||
|| ############################################# ||
\*===============================================*/

$(document).ready(function(){
	/* The following code is executed once the DOM is loaded */
	
	/* This flag will prevent multiple comment submits: */
	var working = false;
	
	/* Listening for the submit event of the form: */
	$('.jak-ajaxform').submit(function(e){

 		e.preventDefault();
		if(working) return false;
		
		working = true;
		var lsform = $(this);
		var button = $(this).find('.ls-submit');
		// $(this).find('.form-group').removeClass("has-danger");
		$(this).find('input').removeClass("is-invalid");
		$(this).find('input').removeClass("is-valid");
		$(this).find('#name-help').html("");
		
		$(button).html(ls.ls_submitwait);

		var request = $.ajax({
			async: true,
		  url: ls.main_url+ls.lsrequest_uri,
		  type: "POST",
		  data: $(this).serialize(),
		  dataType: "json",
		  processData: false,
		  cache: false
		});
		
		request.done(function(msg) {

			working = false;
			$(button).html(ls.ls_submit);
			
			if(msg.status) {
			
				$('.jak-thankyou').addClass("alert alert-success").fadeIn(1000).html(msg.html);
				$(lsform)[0].reset();
				
				// Fade out the form
				// $(lsform).fadeOut().delay('500');

				// disable the button
				$(button).attr('disabled','disabled');

				// Reset the Iframe Height/Width
				var width = document.getElementById('lcjframesize').offsetWidth;
				var height = document.getElementById('lcjframesize').offsetHeight;
				iframe_resize(width, height, msg.widgetstyle, msg.baseurl);

				var counter = 0;
				var interval = setInterval(function() {
				    counter++;
				    // Display 'counter' wherever you want to display it.
				    if (counter == 6) {
				        // Display a login box
				        window.location.replace(msg.link);
				    }
				}, 1000);
				
			} else if(msg.login) {
				
				window.location.replace(msg.link);
				
			} else {
				/*
				/	If there were errors, loop through the
				/	msg.errors object and display them on the page 
				/*/

				if (msg.html) $('.jak-thankyou').addClass("alert alert-danger").fadeIn(1000).html(msg.html);
				
				$.each(msg.errors,function(k,v) {
					$('#'+k).addClass("is-invalid");
					$(lsform).find('#name-help').html(v);
					// $('#'+k).closest(".form-group").addClass("has-danger");
				});
			}
			
			working = false;
			
		});

	});
	
});