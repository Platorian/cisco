Attackers may leverage insecure SMTP servers to send spam and conduct phishing and other email-based attacks. SMTP is a server-to-server protocol, which is different from client/server protocols such as POP3 or IMAP.

- **TCP port 25**: The default port used in SMTP for non-encrypted communications.
- **TCP port 465**: The port registered by the Internet Assigned Numbers Authority (IANA) for SMTP over SSL (SMTPS). SMTPS has been deprecated in favor of STARTTLS.
- **TCP port 587**: The Secure SMTP (SSMTP) protocol for encrypted communications, as defined in RFC 2487, using STARTTLS. Mail user agents (MUAs) use TCP port 587 for email submission. STARTTLS can also be used over TCP port 25 in some implementations.
- **TCP port 110**: The default port used by the POP3 protocol in non-encrypted communications.
- **TCP port 995**: The default port used by the POP3 protocol in encrypted communications.
- **TCP port 143**: The default port used by the IMAP protocol in non-encrypted communications.
- **TCP port 993**: The default port used by the IMAP protocol in encrypted (SSL/TLS) communications.

_SMTP_ _open relay_ is the term used for an email server that accepts and _relays_ (that is, sends) emails from any user. It is possible to abuse these configurations to send spoofed emails, spam, phishing, and other email-related scams. Nmap has an NSE script to test for open relay configurations.

```
nmap --script smtp-open-relay.nse 10.1.2.14
```

**Useful SMTP Commands**

- **HELO:** Used to initiate an SMTP conversation with an email server. The command is followed by an IP address or a domain name (for example, **HELO 10.1.2.14** ).
- **EHLO:** Used to initiate a conversation with an Extended SMTP (ESMTP) server. This command is used in the same way as the **HELO** command.
- **STARTTLS:** Used to start a Transport Layer Security (TLS) connection to an email server.
- **RCPT:** Used to denote the email address of the recipient.
- **DATA:** Used to initiate the transfer of the contents of an email message.
- **RSET:** Used to reset (cancel) an email transaction.
- **MAIL:** Used to denote the email address of the sender.
- **QUIT:** Used to close a connection.
- **HELP:** Used to display a help menu (if available).
- **AUTH:** Used to authenticate a client to the server.
- **VRFY:** Used to verify whether a user’s email mailbox exists.
- **EXPN:** Used to request, or expand, a mailing list on the remote server.

An example of how you can use some of these commands to reveal email addresses that may exist in the email server. In this case, you connect to the email server by using **telnet** followed by port 25. (In this example, the SMTP server is using plaintext communication over TCP port 25.) Then you use the **VRFY** (verify) command with the email username to verify whether the user account exists on the system.

```
omar@kali:~$ telnet 192.168.78.8 25
Trying 192.168.78.8...
Connected to 192.168.78.8.
Escape character is '^]'.
220 dionysus.theartofhacking.org ESMTP Postfix (Ubuntu)
VRFY sys
252 2.0.0 sys
VRFY admin
550 5.1.1 <admin>: Recipient address rejected: User unknown in localrecipient table
VRFY root
252 2.0.0 root
VRFY omar
252 2.0.0 omar 
```

**Automation**

```
smtp-user-enum
```

**Enumerate User**

```
smtp-user-enum -M VRFY -u omar -t 192.168.78.8
```

_Using_ **_searchsploit_** _to Find Known SMTP Exploits_

```
searchsploit smtp
```

