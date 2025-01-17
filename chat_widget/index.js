import React, {useEffect} from 'react'
import dotenv from 'dotenv'
dotenv.config()

export default function ChatWidget(){
    useEffect(()=>{
        launchChatWidget(window, document, 'script', `https://${process.env.REACT_APP_SITE_URL}/livechat/`)
    })
    const launchChatWidget =(w, d, s, u)=> {
        w.id = 1; w.lang = ''; w.cName = ''; w.cEmail = ''; w.cMessage = ''; w.lcjUrl = u;
        var h = d.getElementsByTagName(s)[0], j = d.createElement(s);
        j.async = true; j.src = `https://${process.env.REACT_APP_SITE_URL}/livechat/js/jaklcpchat.js`;
        h.parentNode.insertBefore(j, h);
    }
    return(
        <React.Fragment></React.Fragment>
    )
}