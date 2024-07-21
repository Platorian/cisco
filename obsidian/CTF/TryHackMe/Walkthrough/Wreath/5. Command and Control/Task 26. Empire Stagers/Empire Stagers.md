Stagers are Empire's payloads. They are used to connect back to waiting listeners, creating an agent when executed.  

We can generate stagers in either Empire CLI or Starkiller. In most cases these will be given as script files to be uploaded to the target and executed. Empire gives us a huge range of options for creating and obfuscating stagers for AV evasion; however, we will not be going into a lot of detail about these here.

---

Let's first look at generating stagers in the Empire CLI application.

From the main Empire prompt, type `usestager`  (including the space!)  to get a list of available stagers in a dropdown menu.  

There are a variety of options here. When in doubt, `multi/launcher` is often a good bet. In this case, let's go for `multi/bash` (`usestager multi/bash`):  
![Showing the options for usestager multi/bash after selection](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/ce5729866d07.png)  

As with listeners, we set options with `set OPTION VALUE`. There are many options here, but the only thing we need do is set the listener to the name of the listener we created in the previous task, then tell Empire to `execute`, creating the stager in our `/tmp` directory:  
![Setting the listener to connect to, then executing the stager](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/3e295bf67fb9.png)  

We now need to get the stager to the target and executed, but that is a job for later on. In the meantime we can save the stager into a file on our own attacking machine then once again exit out of the stager menu with `back`.

---

Not unexpectedly, the process for generating stagers with Starkiller is almost identical.  

First we switch over to the Stagers menu on the left hand side of the interface:  
![Showing the stagers menu on the left hand side of the Starkiller interface](https://assets.tryhackme.com/additional/wreath-network/8a10ffe7d3be.png)  

From here we click "Create" and once again select `multi/bash`.  

We select the Listener we created in the previous task, then click submit, leaving the other options at their default values:  
![Setting the Listener name, then executing the stager](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/15e298c934fb.png)  

This brings us back to the stagers main menu where we are given the option to copy the stager to the clipboard by clicking on the "Actions" dropdown and selecting "Copy to Clipboard":  
![Highlighting the button allowing us to copy the stager to the clipboard](https://assets.tryhackme.com/additional/wreath-network/empire-update-4.0/71a9dfe8dffa.png)

Once again we would now have to execute this on the target.  

---

Answer the questions below

Using your choice of Empire CLI or Starkiller, generate a `multi/bash` stager and save it as a file on your own disk.  

**Bonus Question (Optional):** Read through the code in the script and see if you can decipher what it is doing. You will need to decode the payload from Base64 before doing so.

