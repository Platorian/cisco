# CVE-2021-3156 Baron Samedit

In January 2021, [Qualys](https://qualys.com) released a [blog post](https://blog.qualys.com/vulnerabilities-research/2021/01/26/cve-2021-3156-heap-based-buffer-overflow-in-sudo-baron-samedit) detailing a terrifying new vulnerability in the Unix sudo program.

Specifically, this was a heap buffer overflow allowing any user to escalate privileges to root -- no misconfigurations required. This exploit works with the default settings, for any user regardless of sudo permissions, which makes it all the scarier. The vulnerability has been patched, but affects any unpatched version of the sudo program from 1.8.2-1.8.31p2 and 1.9.0-1.9.5p1, meaning that it's been around for the last ten years.  

The program was very quickly patched (with patched versions making their way into repositories soon after), so this exploit will no longer work on up-to-date targets; however, it is still incredibly powerful.

As with CVE-2019-18634 (which we saw in the [second sudovulns room](https://tryhackme.com/room/sudovulnsbof)), this vulnerability is a buffer overflow in the sudo program; however, this time the vulnerability is a _heap_ buffer overflow, as opposed to the _stack_ buffer overflow we saw before. The stack is a very regimented section of memory which stores various important aspects of a program. The heap, on the other hand, is reserved for dynamic allocation of memory, allowing for more flexibility in how values and constructs are created and accessed by a program. As with the previous room, we will not go into a huge amount of detail about how this works in the interests of keeping the content beginner friendly. All we really need to understand is that this vulnerability is incredibly powerful, and extremely wide-reaching.

---

So, first up, what can we do to check whether a system is vulnerable?

Fortunately there is a very easy method we can use to check; simply enter this command into a terminal:  
`sudoedit -s '\' $(python3 -c 'print("A"*1000)')`  

```php
sudoedit -s '\' $(python3 -c 'print("A"*1000)')
```

If the system is vulnerable then this will overwrite the heap buffer and crash the program:  
![](https://assets.muirlandoracle.co.uk/thm/rooms/sudovulnssamedit/c32e7007f934.png)

This PoC was obtained from a researcher named [lockedbyte](https://twitter.com/lockedbyte), [here](https://github.com/lockedbyte/CVE-Exploits/tree/master/CVE-2021-3156).  

---

When the advisory first came out, Qualys did not supply full code for the exploit. It did not take long for other researchers to replicate the vulnerability; however. The first working copy of the exploit to be made publicly available was created by a researcher known as [bl4sty](https://twitter.com/bl4sty). Their full exploit code can be found on Github, [here](https://github.com/blasty/CVE-2021-3156). This is what we will be using to exploit the machine you deployed in the first task.

This machine has been setup to allow for easy exploitation of the vulnerability. As such, the Github repository linked above has already been added to the target.

In the home directory you will see a folder called "Exploit":  

![](https://assets.muirlandoracle.co.uk/thm/rooms/sudovulnssamedit/806b4a62adb8.png)

  

Enter this directory (`cd Exploit`) -- you will see a file called "Makefile". This indicates that we can automatically compile the exploit simply by typing "`make`" and pressing enter:  
![](https://assets.muirlandoracle.co.uk/thm/rooms/sudovulnssamedit/53101d57c1cd.png)

  

Checking the contents of the directory again, we see that a new executable file has appeared:  
![](https://assets.muirlandoracle.co.uk/thm/rooms/sudovulnssamedit/5a0799b0ab70.png)  

When we run this file we will be presented with several options:  
![](https://assets.muirlandoracle.co.uk/thm/rooms/sudovulnssamedit/80721070d085.png)  

_**Note:** the name of the executable has been changed here as it is the answer to Question 1._  

There are currently three targets which this exploit will work against. The machine we deployed is an Ubuntu 18.04.5 server, so we will use target 0.

When executed with the target specified as a parameter, we gain a root shell!  
![](https://assets.muirlandoracle.co.uk/thm/rooms/sudovulnssamedit/afb5266cb8d8.png)  

  

---

Now it's your turn!

Use the machine in your browser, or login over SSH using these credentials:

- **Username:** `tryhackme`
- **Password:** `tryhackme`

The command will be:  
`ssh tryhackme@10.10.97.176`

_**Note:** if the above command does not display an IP address then you haven't booted the machine, or haven't given it time to load._

---

```php
ssh tryhackme@10.10.97.176
```

Check if it's vulnerable:

```php
sudoedit -s '\' $(python3 -c 'print("A"*1000)')
```

- CD into exploit directory and type `make` to compile our exploit
- Enter Target option, in this case 0
- Run exploit to gain root

![[Pasted image 20240713045116.png]]

![[Pasted image 20240713045613.png]]
