---
myip: IP
target: Target
---


<% tp.frontmatter.myip %>  <% tp.frontmatter.target%>


nmap -A -O -T4 <% tp.frontmatter.target%>
nikto -h <% tp.frontmatter.target%>


