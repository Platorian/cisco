# Description
This is a challenge that is exactly what is says on the tin, there are a few challenges around investigating a windows machine that has been previously compromised.

Connect to the machine using RDP. The credentials the machine are as follows:

Username: Administrator  
Password: letmein123!

Please note that this machine does not respond to ping (ICMP) and may take a few minutes to boot up.  

Answer the questions below

Whats the version and year of the windows machine?  

Which user logged in last?  

When did John log onto the system last?

Answer format: MM/DD/YYYY H:MM:SS AM/PM

What IP does the system connect to when it first starts?  

What two accounts had administrative privileges (other than the Administrator user)?

Answer format: username1, username2

Whats the name of the scheduled task that is malicous.  

What file was the task trying to run daily?  

What port did this file listen locally for?  

When did Jenny last logon?  

At what date did the compromise take place?

Answer format: MM/DD/YYYY

During the compromise, at what time did Windows first assign special privileges to a new logon?

Answer format: MM/DD/YYYY HH:MM:SS AM/PM

What tool was used to get Windows passwords?  

What was the attackers external control and command servers IP?  

What was the extension name of the shell uploaded via the servers website?  

What was the last port the attacker opened?  

Check for DNS poisoning, what site was targeted?

---

Connection:

```php
xfreerdp /u:Administrator /p:letmein123! /v:10.10.132.152
```

Screen modification:
- `-f`
- `/dynamic-resolution`


![[Pasted image 20240720092904.png]]

![[Pasted image 20240720093530.png]]

![[Pasted image 20240720094011.png]]

![[Pasted image 20240720094046.png]]

![[Pasted image 20240720095802.png]]

![[Pasted image 20240720100020.png]]

![[Pasted image 20240720100218.png]]

![[Pasted image 20240720100541.png]]

![[Pasted image 20240720101103.png]]

![[Pasted image 20240720101245.png]]

https://4sysops.com/archives/displaying-running-and-stopping-scheduled-tasks-with-powershell/

![[Pasted image 20240720104200.png]]

Inside this file, we can see something is off about it. To start, a lot of the sites are pointed at the local host, and secondly google is in here. Seems like some kind of DNS poisoning is going on. If we had a backup copy or could revert to a previous state, then we would definitely know. We should go to the Registry and see if we can discover where this start up program is connecting too

- Now in the remote desktop, press the Windows key, or click on the _Start Menu_ icon. Just start typing _regedit,_ this will only yield one result, click on it or press enter.

- The Registry Editor window will pop up. Follow this path, _HKEY_LOCAL_MACHINE >_ _SOFTWARE > Microsoft > Windows > CurrentVersion > Run_.

![[Pasted image 20240720104727.png]]

![[Pasted image 20240720105606.png]]

![[Pasted image 20240720110547.png]]

