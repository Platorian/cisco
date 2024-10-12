## Keep it Simple

- Less points of entry
- Segmented code
- OOP

### Segmented Code

The problem with the following code is that to access the other pages you have to call them by using this type of call:

`index.php?page=login`

Hackers can often use this to get access to secure or sensitive files:
`www.example.com/index.php?page=robots.txt`

```php
<?php
// Check if a page is called, if it isn't, go to the home page.
$page = isset($_GET['page']) ? $_GET['page'] : "home";

//Includes folder.
$folder = "includes/";

// Get all files from folder.
$files = glob($folder . "*.php");
$file_name = $folder . $page . ".php";

// Check if the file is present in the folder, if not, default the 404 page
if(inarray($file_name, $file))
{
	include($fiel_name);
}else{
	include "includes/404.php"
}
```

So here what we really want is for the website URL to look something like this:
`www.example.com/login`

To do this we can use the `.htaccess` file to rewrite the url:

```php
RewriteEngine On

RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php?url=$1 [L,QSA]
```

Header file

```html
<center>
<a href="home">Home</a> . <a href="profile">Profile</a> . <a href="posts">Posts</a> . <a href="sighnup">Signup</a> . <a href="login">Login</a></center>
```

You would want to include the file like so: 

```php
<?php include("header.php")
```
- The file is an absolute path, so it shouldn't need sanitising.

_Look inside the GET variable: `print_r($GET)`_

If you wanted to publish the web-app you would use private/public folders which was already covered earlier. Everything in the includes folder would go into private, and the `.htaccess` file and `index.php` would be in public.

You would need to update some of the code to match the new setup, for example, you would change `$folder = 'includes/'` to `$folder = '../private/includes/'`, so that the app could access the correct directory.

---

**Completed:** _05:47 2024-09-09_




