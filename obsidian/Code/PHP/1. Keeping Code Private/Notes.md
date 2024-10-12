1. Use public and private folders. 
2. Make index file in every folder. 
3. Use .htaccess file to view forbbinden message. 
4. Always use .php extension.
5. Avoid directory listing `-index` `-indexes`.
6. Keep functions in separate files, and use `include function` to use them. 

**Use public and private folders**

- Public folder is the defaul landing folder. If you make a website, for example, it will ask you where the landin page is, and you would want to select the public folder.

**Avoid directory listing `-index` `-indexes`**

- Index.php goes in the public folder and the functions go in the private folder. I can include them in the php script when needed.

```php
<?php

include "../private/functions.php";

hey();
```

```php
<?php
function hey()
{
	echo "hey";
}
php?>
```

**Make index file in every folder** 

- If there isn't an `index.php` file, it will show a directory listing for all of the files, which leaves it vulnerable. 
	- Required files:
		- index.php or index.html
		- home.php or home.html


- If you make a new folder, let's say for images, you would want to add a blank index.php file to hide the directory listings. **Every folder needs an index.php file** to protect from this vulnerability.

- In theory, you can only access the private folder from the `http://localhost/`. That's why i can access it in the script by using a linux back command: `../`.

- A `.htaccess` file can be used to block access to the private folder.

```php
Options -Idexes
```
- The options will remove any error messages.
- You can setup a password system to access the files, but it's not advisable.
	- You may forget the password.
	- Someone brute-forces the credentials. And gains access to the files.
	- Add the `index.php` file for extra security. 

**Always use .php extension**

If you have a config file for instance that just includes some text or json data, you may be tempted to save it as a `.txt` or `.json` file: `include "../private/config.json"`, but if you brute-force the web-server directories and manage to find the file, you'd be able to navigate to it, and it would show you the data file in plain text. 

```php
<?php

$name = "john";
$age = 22;

php?>
```

Or

```php
<?php

$json = '
[{
	"name": = "john";
	"age": = "22"
]}
';
php?>
```

- As you'll be able to guess, the `index.php` file would block this from being readable, unlike the `.txt` or `.json` data, even though it includes the same contents, so this is the better, more secured way to store data files. 






