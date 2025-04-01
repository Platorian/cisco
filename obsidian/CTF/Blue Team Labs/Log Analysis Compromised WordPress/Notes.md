Unzip file with password
```sh
unzip -P btlo btlo_wordpress.zip
```

Check how many lines are in the file
```sh
wc -l access.log
```

Check the end of the file 
```sh
tail access.log
```

Identify the admin login panel
 ```sh
cat access.log | grep "\.php" | cut -d " " -f 7
```
- Escape the `.` for the PHP file
- Apache log files usually have the page at field 7

Stack duplicates on top of each other 
```sh
cat access.log | grep "\.php" | cut -d " " -f 7 | sort -c
```
- c - count the amount of entries

Search for unique entries 
```sh
cat access.log | grep "\.php" | cut -d " " -f 7 | sort -c | uniq
```

Use sort again to show the top values in descending order
```sh
cat access.log | grep "\.php" | cut -d " " -f 7 | sort -c | uniq | sort -nr
```

Use head to grab the top 5 values
```sh
cat access.log | grep "\.php" | cut -d " " -f 7 | sort -c | uniq | sort -nr | head -n 5
```

Top result
```sh
/wp/login.php?itsec-hb-token=adminlogin
```

---

You can now determine which IP was accessing the login page finding the possible attacker
```sh
grep "/wp/login\.php?itsec-hb-token=adminlogin" access.log
```
- You'll need to escape some of the characters

Use cut to pull out the first field which would be the IP
```sh
grep "/wp/login.php?itsec-hb-token=adminlogin" access.log | cut -d " " -f 1
```

Sort, count, and show the top values in descending order
```sh 
grep "/wp/login.php?itsec-hb-token=adminlogin" access.log | cut -d " " -f 1 | sort | uniq -c | sort -nr
```
- You could do reputation checks on the IP

---

**Find  Tools the Attacker Used**

Search user agents.
```sh
cat access.log | head -n 1
```

Cut at a different delimiter to search for user agent
```sh
cat access.log | cut -d "\"" -f 6 
```

Sort, count and show the top values in descending order
```sh
cat access.log | cut -d "\"" -f 6 | sort | uniq -c | sort -nr
```

Remove error logs
```sh
cat access.log | cut -d "\"" -f 6 | sort | uniq -c | sort -nr | grep -v "error"
```

Parse user agents: https://www.whatismybrowser.com/

**Tools:** sqlmap, WPScan

Find the IP of user using the hacking tools
```sh
cat access.log grep "sqlmap"
```

```sh
cat access.log grep "WPScan"
```
- Paste IP into virus total
- Whois the IP 
- Grep the IP in the access log to see what else it was doing

---

**Vulnerability in Contact Form 7**

Grep for contact
```sh
grep "contact" access.log
```














