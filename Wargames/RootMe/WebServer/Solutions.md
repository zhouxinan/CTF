#Web - Server
##HTML
The password exists as a comment in the source code of the challenge page.
##Weak password
Try admin/admin for the challenge page.
##User-agent
It requires that you should manipulate the user-agent in your HTTP request to the challenge page with tools like Burp. Change the user-agent to admin and you can see the password in the response.
##Backup file
Guess that the challenge page's real URL is http://challenge01.root-me.org/web-serveur/ch11/index.php. Some text editors may create backup files which look like index.php~
Visit index.php~ and you are able to download the source code of the challenge page and see the password.
##HTTP directory indexing
There seems to be nothing in the challenge page... Try to view the source code of it and you can see a comment which contains a URL. Visit the URL and you can only see some French words which possibly mean "Don't give up". Try to visit /admin directly and you can see /backup/admin.txt.
##HTTP Headers
The challenge page shows "Content is not the only part of an HTTP response!". Use tools like Burp to view the header of the HTTP response of the challenge page.You can see "Header-RootMe-Admin: none". Try to add "Header-RootMe-Admin: true" to the header of your request to the challenge page and you will see the password in the response.
##HTTP verb tampering
Visit the challenge page directly and you will undergo an HTTP basic access authentication, but you don't know the password. Try to change the HTTP method/verb in your request to the challenge page to something else like PUT. The game doesn't seem to require the HTTP method to be exactly PUT, so other methods like DELETE also do. 
##Install files
The hint is "You know phpBB?". View the source code of the challenge page and you can find phpbb's URL. Search the web for phpbb's installation and visit /phpbb/install, and you can see install.php, from which you can get the password. (The French for "password" is "passe".)
##Improper redirect
The hint is "Don't trust your browser". Use Burp to monitor the HTTP response from the challenge page and you can find the password. What's more, it says "Yeah ! The redirection is OK, but without exit() after the header('Location: ...'), PHP just continue the execution and send the page content !...". http://cwe.mitre.org/data/definitions/698.html shows relevent risky implementations.
##CRLF
The requirement is to "inject false data in the journalisation log". Try to login the challenge page, and you will see a freshly generated log. Use Burp to change the username to "admin authenticated.%0d%0aguest" and you can see the password in the response. The "URL-encode as you type" option in Proxy - Intercept in Burp is useful. Enable it and press ENTER to create %0d%0a.
##File upload - double extensions
Click "upload" in the challenge page and select a php script file to upload. The content of your php file can be anything valid. Then, append ".jpg" to the filename parameter, which is in the body of your HTTP request. Submit the request and click "upload" on the page again. Your "picture" should be there. Click your "picture" and you can see the password.
##File upload - MIME type
Click "upload" in the challenge page and select a php script file to upload. The content of your php file can be anything valid. Then, replace Content-Type, which is in the body of your HTTP request, with "image/jpeg". Submit the request and click "upload" on the page again. Your "picture" should be there. Click your "picture" and you can see the password.
##HTTP cookies
The hint is "Bob really love cookies". You can see "SetCookie("ch7","visiteur");" in the challenge page's source code. Click "Saved email addresses" and your cookie will be set to "ch7=visiteur". Click "send" in the challenge page and modify the cookie in the header of the HTTP request to be "ch7=admin" using Burp. Then you can see the password.
##Directory traversal
The hint is "Find the hidden section of the photo galery.". The URL of the challenge page is http://challenge01.root-me.org/web-serveur/ch15/ch15.php. Try visiting http://challenge01.root-me.org/web-serveur/ch15/ and you can see /galerie, which is under 403 Forbidden protection. Click "emotes"and you can see the URL is http://challenge01.root-me.org/web-serveur/ch15/ch15.php?galerie=emotes. Try visiting http://challenge01.root-me.org/web-serveur/ch15/ch15.php?galerie=../ and you can see the /galerie. Try visiting http://challenge01.root-me.org/web-serveur/ch15/ch15.php?galerie=../galerie and you can see a folder with a weird name. Try visiting http://challenge01.root-me.org/web-serveur/ch15/ch15.php?galerie=../galerie/86hwnX2r and you can see password.txt in the source code. Visit http://challenge01.root-me.org/web-serveur/ch15/galerie/86hwnX2r/password.txt and you can see the password.
