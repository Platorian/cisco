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