Time to put this all into practice!

You should already have a `http_hop` listener started in either Empire or Starkiller from the last task. If you don't, take this opportunity to start one before continuing.

With the listener started there are two things we must do before we can get an agent back from the Git Server:-

- We must generate an appropriate stager for the target
- We must put the `http_hop` files into position on .200, and start a webserver to serve the files on the port we selected during the listener creation. This server must be able to execute PHP, so a PHP Debug server is ideal

---

Let's start with generating a stager. For this we will use the `multi/launcher` stager. We already covered how to create stagers back in task 26, so you should be able to do this relatively unguided. The only option needing to be set here is the "Listener" option, which needs set to the name of the `http_hop` listener we created in the previous task:

**Empire CLI:**  
![Setting the Listener option for the http_hop listener in Empire CLI Client](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/948827be57c0.png)

**Starkiller:**  
![Making a multi/launcher in Starkiller](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/18461d0a00ec.png)

If using the Empire CLI, you will be presented with a payload to copy and paste into the target's command line:  
![Showing the payload generated by Empire CLI to be copied into the target command line](https://assets.tryhackme.com/additional/wreath-network/597e71846d80.png)  

If using Starkiller you can copy the payload to your clipboard by clicking on the copy button of the Actions menu for the stager in the main Stagers menu:  
![Showing the payload generated by Starkiller](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/df9e3449f125.png)  

Whichever method you chose, save the provided command somewhere and _do not_ execute it yet. We will need it once we have set up the hop files on the jumpserver.  

---

Now let's get that jumpserver set up!

First of all, in the /tmp directory of the compromised webserver, create and enter a directory called `hop-USERNAME`. e.g.:  
![Creating a directory called hop-USERNAME in the /tmp directory of the compromised webserver. e.g. mkdir /tmp/hop-USERNAME, cd /tmp/hop-USERNAME](https://assets.tryhackme.com/additional/wreath-network/d2ca11ee5470.png)  

Transfer the contents from the `/tmp/http_hop` (or whatever you called it) directory across to this directory on the target server. A good way to do this is by zipping up the contents of the directory (`cd /tmp/http_hop && zip -r hop.zip *`), then transferring the zipfile across using one of the methods previously shown. For example, doing this with a Python HTTP server:  
![Demonstrating transferring the zip file using a Python HTTP server, as well as how to zip the file up.](https://assets.tryhackme.com/additional/wreath-network/b3fa83178a6e.png)  

We can then unzip the zipfile on the webserver (i.e. `unzip hop.zip`):  
![Demonstrating unzipping the file on the target](https://assets.tryhackme.com/additional/wreath-network/f5e072039e18.png)  

_**Note:** the output of_ `ls` must _match up with the screenshot -- i.e. there should be a_ `news.php` _file in your current directory, with_ `admin/` _and_ `login/` _as subdirectories._  

We now need to actually serve the files on the port we chose when generating the http_hop listener (task 28). Fortunately we already know that this server has PHP installed as it serves as the backend to the main website. This means that we can use the PHP development webserver to serve our files! The syntax for this is as follows:  
`php -S 0.0.0.0:PORT &>/dev/null &`  

e.g:  
![Demonstrating the process of setting up the PHP debug server](https://assets.tryhackme.com/additional/wreath-network/b46fe13b58a7.png)

As shown in the screenshot, the webserver is now listening in the background on the chosen port 47000.

_**Note:** Remember to open up the port in the firewall if you haven't already!_  

This is a handy trick for when we need to serve PHP files, as our standard Python HTTP webserver is not capable of interpreting the PHP language and so cannot execute the scripts.

---

We now have everything we need to get this show on the road!  

---

Answer the questions below

Both the reverse shell we received way back in task 19, and our evil-winrm access are already running in Powershell, so we would need to adapt the stager generated for us by Empire in order to use them. Instead, it is easier to use it with the webshell we originally used to compromise the machine (i.e. paste the stager as the value of the "a" parameter in cURL or BurpSuite), remembering to URL encode the stager first.  

After sending the web request, you should receive an agent in Empire CLI / Starkiller!  
![Receiving the agent](https://assets.tryhackme.com/additional/wreath-network/8f727d417f68.png)

Note that the IP here is still `.200`. This is due to the jumpserver in between our target (the Git server) and our Empire client acting as a proxy in and out of the network.

Bearing this in mind, get an agent back from the Git Server!

---

**Completed:** _2024-07-22_ 
