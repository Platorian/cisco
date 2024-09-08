**Analysis:** 

Main page details:
_First post! I built this blog engine around one basic concept: PHP doesn't need a template language because it is a template language. This server can't talk to the outside world and nobody but me can upload files, so there's no risk in just using include()._

`<a href="?page=admin.auth.inc">Admin login</a>`

The page has a comment mechanism that tells me i can leave unlimited messages.

After leaving a message i get further info:
`Comment submitted and awaiting approval!`
`href="javascript:window.history.back()"`

Taking a look at /admin/auth `GET /?page=admin.auth`

![[Pasted image 20240908071807.png]]

I've noticed i missed off the `.inc` from the page, after adding it gives me access to the admin login page:

`GET /?page=admin.auth.inc`

![[Pasted image 20240908072900.png]]

I try a test user/pass to see how the login functions, and it doesn't look like it gives any type of information disclosure when entering fake details.

![[Pasted image 20240908073247.png]]

I'll try running a small user/pass combo of common names and passwords for admin, but first i'll see if there is a lockout mechanism by trying a fake password a few times.

Tried a few quick SQL username attacks with no luck. Probably the `include()` needs looking at, but i'll try running some common passwords with username `cody` which is given on the web-server.

I try some simple php in the comment section:

```php
<?php echo 'Hello, World!'; ?>
```

`^FLAG^62ebc4da611ed98371994c0118b828df9e2220f4ceacd99bf3b5ef555fc07218$FLAG$`

Acquired By:

1. For this flag the first thing that I want to do is open ZAP and see what the network request and response are on refresh. This shows me that the site is running PHP 5.5.9 and Nginx 1.14.0. So, the webpage is using php to communicate with the Nginx server. Cool.
2. According to CVE Details has a LOT of security issues and Remote Code Execution seems to be the most popular exploitable thing so let's try that. For this I want to put a simple php script into the comment box.

![[Pasted image 20240908081732.png]]

_Once RCE is achieved with simple code, malicious code could be used to try and get more information out of the server, or take over accounts._


I'm able to bypass the login by removing auth from the request:

![[Pasted image 20240908085825.png]]

At the bottom of the response page is the admin flag.

Admin flag is:
`^FLAG^69c538e743513a45378a5beb87929dd234c49d81babe70b51e8e0445cb0432bb$FLAG$`

There is an interesting message that is awaiting approval that i didn't see right away:
`http: //localhost/index.php? page = http: //google.com/`

PHP payload to access the `index.php` file. I'll add this to the comments and then approve it from the admin page.

```php
<?php echo readfile("index.php")?>
```

Interesting error message:

```php
</b>:  include(): Failed opening '/localhost.php' for inclusion (include_path='.:/usr/share/php:/usr/share/pear') in <b>/app/index.php
</b>
</b>:  include(http://localhost/index.php.php): failed to open stream: HTTP request failed! HTTP/1.1 404 Not Found
 in /app/index.php
</b>
```

- The app was adding an extra `php` onto the extension, or i was, so it wouldn't function at first, but i figured it out eventually.

**Payload:** 
`GET /?page=http://localhost/index`

**Flag:** 
`^FLAG^dd31013c155e0fd938cb5c85fb572252737e0df899a89b97eb66e0346bc32220$FLAG$`

![[Pasted image 20240908093824.png]]

---

**Completed:** _09:38 2024-09-08_
