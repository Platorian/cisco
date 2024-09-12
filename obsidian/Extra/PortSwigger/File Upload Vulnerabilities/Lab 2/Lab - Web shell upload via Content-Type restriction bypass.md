This lab contains a vulnerable image upload function. It attempts to prevent users from uploading unexpected file types, but relies on checking user-controllable input to verify this.

To solve the lab, upload a basic PHP web shell and use it to exfiltrate the contents of the file `/home/carlos/secret`. Submit this secret using the button provided in the lab banner.

You can log in to your own account using the following credentials: `wiener:peter`

---

I login in with the provided credentials and upload the file after modifying the content type header. 

![[Pasted image 20240912085450.png]]

![[Pasted image 20240912085516.png]]

Flag
`60xSZ2nYwTqVVqrOj3nMJbkFnOUV2aIM`

