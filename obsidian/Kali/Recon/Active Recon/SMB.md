
Enumeration
enum4linux -a <% tp.frontmatter.target %>

SMB Client

List Shares
smbclient -L //<% tp.frontmatter.target %>/

Connect to Share
smbclient //<% tp.frontmatter.target %>/IPC$

Put Files
put badfile.txt badfile.txt


Method
1. Scan the network with Nmap to identify hosts that are running SMB.  
2. Scan the target host or host subnet using enum4linux to enumerate workgroups, password policies and shares.  
3. Run smbclient and use the put command to copy the dummy file to a vulnerable host or hosts.

NSE Scripts
ls -l /usr/share/nmap/scripts | grep smb
