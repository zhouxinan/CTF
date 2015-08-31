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

