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






 