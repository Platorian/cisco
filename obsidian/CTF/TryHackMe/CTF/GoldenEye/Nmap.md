```php
Nmap scan report for 10.10.202.164                                                                                                                                                05:03:32 [8/102]
Host is up (0.030s latency).
Not shown: 65531 closed tcp ports (conn-refused) 
PORT      STATE SERVICE  VERSION
25/tcp    open  smtp     Postfix smtpd
|_smtp-commands: ubuntu, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN
| ssl-cert: Subject: commonName=ubuntu
| Issuer: commonName=ubuntu
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2018-04-24T03:22:34
| Not valid after:  2028-04-21T03:22:34
| MD5:   cd4a:d178:f216:17fb:21a6:0a16:8f46:c8c6 
|_SHA-1: fda3:fc7b:6601:4746:96aa:0f56:b126:1c29:36e8:442c
|_ssl-date: TLS randomness does not represent time
80/tcp    open  http     Apache httpd 2.4.7 ((Ubuntu))
| http-methods: 
|_  Supported Methods: OPTIONS GET HEAD POST
|_http-server-header: Apache/2.4.7 (Ubuntu)
|_http-title: GoldenEye Primary Admin Server
55006/tcp open  ssl/pop3 Dovecot pop3d
|_ssl-date: TLS randomness does not represent time
| ssl-cert: Subject: commonName=localhost/organizationName=Dovecot mail server
| Issuer: commonName=localhost/organizationName=Dovecot mail server
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2018-04-24T03:23:52
| Not valid after:  2028-04-23T03:23:52
| MD5:   d039:2e71:c76a:2cb3:e694:ec40:7228:ec63 
|_SHA-1: 9d6a:92eb:5f9f:e9ba:6cbd:dc93:55fa:5754:219b:0b77
55007/tcp open  pop3     Dovecot pop3d
|_pop3-capabilities: UIDL AUTH-RESP-CODE SASL(PLAIN) TOP CAPA USER STLS PIPELINING RESP-CODES
|_ssl-date: TLS randomness does not represent time
| ssl-cert: Subject: commonName=localhost/organizationName=Dovecot mail server
| Issuer: commonName=localhost/organizationName=Dovecot mail server
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2018-04-24T03:23:52
| Not valid after:  2028-04-23T03:23:52
| MD5:   d039:2e71:c76a:2cb3:e694:ec40:7228:ec63 
```

