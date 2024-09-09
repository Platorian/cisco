## Keep it Simple

- Less points of entry
- Segmented code
- OOP

### Object Orientated Programming

Here we would want to take out parts of the code from `private/includes/home.php`, and start adding it to a new file called `functions.php`, and that way our home will just link back to the functions as and when they are needed.

For refactor this would be all we needed to do, but we also want to use OOP to make our code more secure and easy to troubleshoot.

For example, you might have some code that deals with the database and user posts, so you could split that up to look something like this OOP pseudo code.

```php
class database
	// Restricts the function
	private function connect_database()

	public function db_query($query) 

class manage_posts

	function get_all_posts()

	function get_one_post($post)
```

Now, if something in the web-app breaks you only have to look at specific functions.  

Including the functions:

```php
<?php
// Include all functions
require ("../private/includes/functions.php");
```

---

Get Post using SQL as the database:

```php
<?php
// Get post 
$query = "select * from posts where id = '$id' limit 1";
$result = db.read($query);
```




