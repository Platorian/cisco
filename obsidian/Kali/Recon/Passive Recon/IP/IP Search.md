host <% tp.frontmatter.target %>

nslookup <% tp.frontmatter.target %>

traceroute <% tp.frontmatter.target %>

Netcraft:
https://www.netcraft.com/

#### Bash global variable 
```bash
export ip=<Target IP>
```

Test
```bash
echo $ip
```

Remove
```bash
export -n ip
```

