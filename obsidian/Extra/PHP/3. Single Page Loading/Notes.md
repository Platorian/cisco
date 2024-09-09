## Keep it Simple

- Less points of entry
- Segmented code
- OOP

Keeping code simple, object orientated programming, and segmented, all helps to keep the web-app secure.  It also makes the code more organised, readable and easier to debug, because you wouldn't be looking at one big piece of code, it would be broken up into smaller sections making bugs much easier to find.

### Less points of entry

Some web-apps will have their web pages setup up like the following:
`www.example.com/index.php`
`www.example.com/signup.php`
`www.example.com/profile.php`
`www.example.com/login.php`
`www.example.com/posts.php`

In this example the web-app would have five entry points, but the app would be much more secure if this was only one page, that could access the rest of the other pages, turning the app from a five to a one entry point application.

This could happen for a number of reasons, for example, a client might request from a developer some new features, which would be implemented in this way.

Of course when this happens you leave more vulnerable points of entry that a malicious actor could use to retrieve sensitive user information, or compromise the web-server.

_If you imagine the web-app is a house. A house with only one door and no windows, would be more secure than a house with five doors and ten windows._

To summarise, a web-app with a single page that can access the rest of the pages, is more secure than a web-app with multiple pages or points of entry.

_Another issue you might get is that to read the different pages you are connecting to the database for every page, instead of just one. So if there is a problem, you would have to visit every page individually and inspect the code to determine what the problem was._

_There should be a function that does the database query so that the one function would be the only piece of code that you would need to review for debugging._

---

### How to secure a multi-page web-app

1. Create an includes folder and put the files inside it
2. Rename the `index.php` file to `home.php` inside of the includes folder, and make a new **empty** `index.php` outside of the includes folder.  
3. Add an empty `index.php` into the includes folder as well so that we hide the folder files from being viewed, or add some type of `access denied` message.

```php
<?php
//this is a comment
echo "Access Denied!"
```
- You only need to close the php tag if you're adding html.


An example of what the new landing page index file would look like. This would be the one outside of includes that's going to call to our home page that's inside of the includes folder.

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

---





