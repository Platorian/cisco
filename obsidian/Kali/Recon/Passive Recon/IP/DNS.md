dnsrecon -d <% tp.frontmatter.target %>

Check firewall
wafw00f <% tp.frontmatter.target %>

dig <% tp.frontmatter.target %>

Use our own name server, in this case cloudflare
dig @1.1.1.1 <% tp.frontmatter.target %>

Limit it to name server
dig <% tp.frontmatter.target %> NS

All records
dig <% tp.frontmatter.target %> ANY

MX records using google name server
dig @8.8.8.8 <% tp.frontmatter.target %> MX

Whois
whois <% tp.frontmatter.target %> 

DNS Dumpster:
https://dnsdumpster.com/