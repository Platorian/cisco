ZoneTransfer.me

Lists domains and subdomains and other useful things.
```
dnsrecon -d zonetransfer.me -t axfr
```

Can show mail records (MX), DNS info, and text files.

Tools: Fierce
```
fierce --domain zonetransfer.me
```

Fierce has it's own wordlist but one can also be provided.
```
fierce --domain zonetransfer.me --subdomains 
fierce --domain zonetransfer.me --subdomains --dns-file <Path To File>
```

Tools: knockpy
```
knockpy zonetransfer.me
```

knockpy with a custom wordlist.
```
knockpy zonetransfer.me -w /usr/share/seclists/Discovery/DNS/<File.txt>
```

