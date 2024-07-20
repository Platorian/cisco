In the previous task we found an exploit that might work against the service running on the second server.

Make a copy of this exploit in your local directory using the command:  
`searchsploit -m EDBID`  

![Using searchsploit to copy the exploit to the local directory](https://assets.tryhackme.com/additional/wreath-network/74c9d9ad5c3a.png)

Unfortunately, the local exploit copies stored by searchsploit use DOS line endings, which can cause problems in scripts when executed on Linux:

![Demonstration of the line endings error which can occur when trying to run scripts written on Windows on a Linux machine](https://assets.tryhackme.com/additional/wreath-network/c8bf9c7b639a.png)  

Before we can use the exploit, we must convert these into Linux line endings using the dos2unix tool:  
`dos2unix ./EDBID.py`

This  can also be done manually with `sed` if `dos2unix` is unavailable:  
`sed -i 's/\r//' ./EDBID.py`  

---

With the file converted, it's time to read through the exploit to make sure we know what it's doing. The fact that the exploit is on Exploit-DB means that it's unlikely to be outright malicious, but there's no guarantee that it will _work_, or do anything close to exploiting a vulnerabilty in the service.

Open the exploit in your favourite text editor and let's get going!  

---

Answer the questions below

1. Look at the information at the top of the script. On what date was this exploit written?  

**`18.01.2018`**

As this is a Python script, the version of the language used to write the software matters. Many older exploits are still written in Python2. These exploits tend to be incompatible with the Python3 interpreter, and vice versa.

Before we can do anything else, we need to determine whether this exploit was written in Python2 or Python3. A quick way of doing this is to look for the `print` statements (used to echo output to the console).  If there are no round brackets (e.g. `print "Hello World!"`) then the exploit will be Python2, otherwise the exploit is likely to be Python3 (e.g. `print("Hello World!")`). Of course, this is far from the only way to check, but it will work for our purposes.

3. Bearing this in mind, is the script written in Python2 or Python3?  

**`python2`**

Now that we know which version of Python we're dealing with we can execute it in one of two ways:

- Using the appropriate interpreter directly (e.g. `python3 exploit.py` / `python2 exploit.py`)
- Adding a shebang line in at the top of the exploit. A shebang tells the Unix program loader which interpreter to use to run a script. Shebangs always start with the characters: `#!`. You then specify the absolute path to the interpreter, so: `#!/usr/bin/python3` / `#!/usr/bin/python2` / `#!/bin/sh`, etc. This means that if we execute the script using `./exploit.py`, it will be executed by the correct interpreter.

Add an appropriate shebang to the exploit, at the very top of the file!  

Let's have a look through some of the key sections of the code.

This script is not designed to be fancy. It does what we need it to do, and nothing more. All configurations are done within the code by literally editing the script, so it's important that we understand the options available to us. These can be found in lines 23-31 (offset by minus one if you didn't add the shebang):  
![Lines 23-31 of the exploit](https://assets.tryhackme.com/additional/wreath-network/b6d7392de1b7.png)  

Realistically we are only interested in the first two variables here, as the other options should be fine at their default values. The two variables we care about are `ip` and `command`, allowing us to specify our target and the command to run, respectively.

Set the IP to the correct target for your choice of pivoting technique. If you used sshuttle or one of the proxying techniques then this will just be the IP of the target. If you used a port forward then it will be `localhost:chosen_port`, e.g.:  
`localhost:8000`  

For the time being we will leave the command as it is. `whoami` is as good a command as any to confirm that the exploit works.  

The bulk of the middle section of the code is taking advantage of the improper access controls which make this vulnerability possible. We will not cover this in detail in order to keep this task relatively short; however, reading through the exploit (and trying to understand it) would be highly advisable.

We are, however, interested in the last 6 lines of the exploit:  
![Last six lines of the exploit set to the default values](https://assets.tryhackme.com/additional/wreath-network/0c95035c81e7.png)  

These create a PHP webshell (`<?php system($_POST['a']); ?>`) and echo it into a file called `exploit.php` under the webroot. This can then be accessed by posting a command to the newly created `/web/exploit.php` file.

For the sake of not spoiling things for other users, we are going to alter this before running the script.

We can leave the payload as it is, but we will alter both instances of "exploit.php" in the script to be `exploit-USERNAME.php`, for example:  
![Last six lines of the exploit when altered to include a username](https://assets.tryhackme.com/additional/wreath-network/312cae5fdfc7.png)  

---

Having added in a shebang, changed the target, and updated the name of the exploit.php file, the exploit should now be fully configured so we will perform the exploit in the next task.

Just to confirm that you have been paying attention to the script: What is the _name_ of the cookie set in the POST request made on line 74 (line 73 if you didn't add the shebang) of the exploit?

**`csrftoken`**

---

**Completed:** _08:18 2024-07-20_
**Author:** z0d
