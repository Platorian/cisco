```php
➜  inter-nmap nmap -sC -sV -p- -oN nmap.txt 10.10.125.48
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-07-14 04:36 BST
Nmap scan report for 10.10.125.48
Host is up (0.025s latency).
Not shown: 65532 closed tcp ports (conn-refused)
PORT      STATE SERVICE VERSION
22/tcp    open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 7d:dc:eb:90:e4:af:33:d9:9f:0b:21:9a:fc:d5:77:f2 (RSA)
|   256 83:a7:4a:61:ef:93:a3:57:1a:57:38:5c:48:2a:eb:16 (ECDSA)
|_  256 30:bf:ef:94:08:86:07:00:f7:fc:df:e8:ed:fe:07:af (ED25519)
2222/tcp  open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 17:7e:55:16:88:62:27:2e:fb:16:1c:f4:95:85:3e:31 (RSA)
|   256 39:af:ac:3b:0c:a9:70:d7:05:f2:e4:4e:17:4a:9e:28 (ECDSA)
|_  256 fd:41:02:5d:f4:19:6d:38:d2:11:4e:8e:51:bd:49:ff (ED25519)
31337/tcp open  Elite?
| fingerprint-strings: 
|   DNSStatusRequestTCP, DNSVersionBindReqTCP, FourOhFourRequest, GenericLines, GetRequest, HTTPOptions, Help, Kerberos, LANDesk-RC, LDAPBindReq, LDAPSearchReq, LPDString, NULL, RPCCheck, RTSPRequest, SIPOptions, SMBProgNeg, SSLSessionReq, TLSSessionReq, TerminalServer, TerminalServerCookie, X11Probe: 
|     In case I forget - user:pass
|_    ubuntu:Dafdas!!/str0ng
```

In case I forget - user:pass
ubuntu:Dafdas!!/str0ng

