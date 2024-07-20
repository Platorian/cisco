Thinking about the interesting service on the next target that we discovered in the previous task, pick a pivoting technique and use it to connect to this service, using the web browser on your attacking machine! 

As a word of advice: sshuttle is highly recommended for creating an initial access point into the rest of the network. This is because the firewall on the CentOS target will prove problematic with some of the techniques shown here. We will learn how to mitigate against this later in the room, although if you're comfortable opening up a port using firewalld then port forwarding or a proxy would also work.

---

Answer the questions below

1. What is the name of the program running the service?  

**`gitstack`**

Head to the login screen of this application. This can be done by adding the answer to the previous question on at the end of the url, e.g. if using sshuttle:  
`http://IP/ANSWER`  

When navigating to this URI, we are given the following login page:  
![Image showing the login screen for the service](https://assets.tryhackme.com/additional/wreath-network/409f76a17496.png)  

2. Do these default credentials work (Aye/Nay)?  

**`nay`**

Shucks -- it couldn't be that easy, huh? Back to the drawing board then!

Use the command: `searchsploit SERVICENAME`, on Kali to search for exploits related to this service.  

You will see that there are three publicly available exploits.

3. There is one Python RCE exploit for version 2.3.10 of the service. What is the EDB ID number of this exploit?

**`43777`**

---

**Completed:** _06:44 2024-07-20_
**Author:** z0d

