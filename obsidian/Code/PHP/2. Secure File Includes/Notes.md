PHP Code Injection _using the include() function._

- Uploading a malicious file that contains php code.
- Via a GET request to files that have been specified by the include() function.
- Could give an attacker remote code execution.
	- Check database for contents
	- Obtain a reverse shell or backdoor

Example:
`index.php?page=home.php`

Could be changed to:
`index.php?page=admin.php`

```php
<?php
$page = isset($_GET['page']) ? $GET['page'] : "home.php";
include ($page);
?>
```

```php
<?php
echo "This is the home page";
?>
```

This can be used for directory traversal because it's not verifying what the page is. 

`?page=../../../../../../etc/passwd`
`?page=../../apache/log/error.log`

If you have a file upload mechanism it can be exploited by using the GET page request. If i save the following php file as text.text, and navigate to it using the `index.php/?page=` request, it will treat the file as a php file, exposing sensitive information.

```php
<?php
phpinfo();
?>
```
- If you hide the php script in an image file, for example, and used the vulnerable include function, you could bypass any restriction on file upload type.

RCE
```php
<?php
shell_exec('ls');
echo "<pre>$output</pre>";
?>
```
- The `echo` line might not be needed.

Vulnerable functions:
- Include
- Require: will run the php code. If you're not expecting php, use `echo file_get_contents` instead. This would hide the php and show plain text.
- Do not leave the file extension to the url: `"home.php"`, This way the `page`variable will only take a name, and not the file extension, which will be added after.

```php
<?php
$page = isset($_GET['page']) ? $GET['page'] : "home.php";
include ($page);
?>
```


```php
<?php
$page = isset($_GET['page']) ? $GET['page'] : "home";
include ($page . ".php");
?>
```
- Here, if you had a website that had user profile pictures, you would still need to check and confirm if something is really an image, so a hacker doesn't add any php code. 
- A hacker could use information received from error codes, if not hidden, to modify the file name, and get a working exploit.

Resize or crop images:

If an image is cropped, or resized, the image will have changed, changing the data, and it should no longer contain any malicious code. 

Check to see that we are reading only the files contained in the current folder.

```php
<?php
$page = isset($_GET['page']) ? $GET['page'] : "home";
$folder = "";
$files = glob($folder"*.php");

if(in_array($page, . ".php", $files)){
	require ($page . ".php");
}else{
	echo "Could not find the file.";
}
?>
```
- Print readable files: `print_r($files)`
- Make sure the array contains the files that you want.
- Will check to see if the page exists in the array.

Does not check for special characters. Could add more files and to the list:
- `$files[] = "john.php"`

This way you are creating a whitelist and not blacklisting. We can pick what we want to see and not what we don't want to see which is more secure. 





