Hacking the API

![[Pasted image 20240621150358.png]]

You can send the request to repeater, but you would have to change the email.
The username is blank because it is set later on in the application.

We can modify the request to state that we are an admin account:

![[Pasted image 20240621150828.png]]

We can bypass security spam filters by using dev tools and network. Sometimes it might give you the answer to some arbitrary question it asks you.

![[Pasted image 20240621151543.png]]

You can also capture the request in Burp and play around with some of the settings in repeater.

![[Pasted image 20240621151752.png]]

Captcha and anti automation is in place to prevent brute forcing attacks. A way to fix this is by limiting it to just one attempt and not allowing it to go through on the same solution to the captcha.

Modifying the basket id so we send the item to someone else. In this case we add on an extra basket id to the end to redirect the goods to that basket rather than our own.

![[Pasted image 20240621152740.png]]

If we can change an API basket item id to a negative number we may be able to get our items for free. Another issue with input validation.

![[Pasted image 20240621153304.png]]

Modify the API with an iframe if it doesn't work in any input fields. We've added some escape characters so the code works.

![[Pasted image 20240621165623.png]]

```java
<iframe src="javascript:alert("XSS")">
```


You can break the upload limit by adding your own stuff to the upload request.

![[Pasted image 20240621170823.png]]

![[Pasted image 20240621170851.png]]

You could also try changing the filename

xml doc with metadata at the top
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- The root Element-->
<gift>
	<!--Child Element-->
	<To>Frank</To>
	<From>Bob</From>
	<Item>A Brand New Car</Item>

<gift>
```

Lets say you have to give out a lot of gifts, you can use an entity, which is like a variable.

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE gift[
	<!ENTITY from "Bob">
]>
<!-- The root Element-->
<gift>
	<!--Child Element-->
	<To>Frank</To>
	<From>&from;</From>
	<Item>A Brand New Car</Item>

<gift>
```

The doctype is called a **Document Type Definition** _DTD_. Inside the doctype is where you declare the entity which is like a variable. In this case our entity is from.

You can't use certain characters inside of the child element but you can use them inside of the entity.

Now lets pull something malicious from payloads all the things.

https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/XXE%20Injection/README.md

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE foo [  
  
  <!ELEMENT foo ANY >
  <!ENTITY xxe SYSTEM "file:///c:/boot.ini" >]><foo>&xxe;</foo>
```

This is attacking Windows` boot.ini`, but we could change that to `/ect/passwd` for linux machines 

SYSTEM is a keyword used in ENTITY which says that it's an external resource, and because of that it will be stored into the entity.

![[Pasted image 20240621174233.png]]

The best way to prevent this is to disable DTDs.

---

Resources:

stok - $7500 bug bounty explained:
https://www.youtube.com/watch?v=aSiIHKeN3ys

HacktheBox Devoops box

---

