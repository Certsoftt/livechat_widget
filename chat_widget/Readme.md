## Overview
This is a live chat widget that can be used on any website, plain html or react or php website

To use chat widget on html or php site kindly use the code last `</body>` tag:

<!-- Live Chat widget -->
`<script type="text/javascript">`
	`(function(w, d, s, u) {`
		`w.id = 1; w.lang = ''; w.cName = ''; w.cEmail = ''; w.cMessage = ''; w.lcjUrl = u;`
		`var h = d.getElementsByTagName(s)[0], j = d.createElement(s);`
		`j.async = true; j.src = 'https://yourdomian.com/livechat/js/jaklcpchat.js';`
		`h.parentNode.insertBefore(j, h);`
	`})(window, document, 'script', 'https://yourdomain.com/livechat/');`
`</script>`
`<div id="jaklcp-chat-container"></div>`
<!-- end Live Chat widget -->

## Admin Panel
For the admin panel, edit the db.php file in the include folder and set all database details to your database details


## React Web App
run the command 
- `npm i react`
- `npm i ubsimple-chat-widget`

create .env file with a varaible to store your site domain name
- REACT_APP_SITE_URL = "your_domain.com"

In your component you can 
- `import ChatWidget from 'ubsimple-chat-widget'`
usage:
`<ChatWidget/>`
