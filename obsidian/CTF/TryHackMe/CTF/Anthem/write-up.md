I find a flag in a blog post on the wesite:

![[Pasted image 20240711094147.png]]

/robots.txt

```output
UmbracoIsTheBest!

# Use for all search robots
User-agent: *

# Define the directories not to crawl
Disallow: /bin/
Disallow: /config/
Disallow: /umbraco/
Disallow: /umbraco_client/
```

Sourcecode blogpost "cheers to the it department"

![[Pasted image 20240711095915.png]]

Checking out the disallowed umbraco

![[Pasted image 20240711100834.png]]

I found an email earlier from the author. 

![[Pasted image 20240711101009.png]]

i tried fuzzing the pass field with owaspzap but nothing came of it.

![[Pasted image 20240711103927.png]]

we try the email SG@anthem.com to follow the same format as the first email i found.

![[Pasted image 20240711105258.png]]

CTL+F for the THM flag.


Username:SG
Pass:UmbracoIsTheBest

```php
xfreerdp /u:SG /p:UmbracoIsTheBest! /v:anthem.com  
```

I needed to add the ip to hosts file.

On RDP:

![[Pasted image 20240711110512.png]]

I find a hidden backup directory in C which i can then give myself permission to read.

`ChangeMeBaby1MoreTime`

![[Pasted image 20240711113248.png]]

```php
xfreerdp /u:Administrator /p:ChangeMeBaby1MoreTime /v:anthem.com
```

THM{Y0U_4R3_1337}

![[Pasted image 20240711113533.png]]


