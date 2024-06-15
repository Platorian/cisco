Basic scan
```
nikto -h zonetransfer.me
```

Specific port.
```
nikto -h zonetransfer.me -p 443
```

To scan domains with HTTPS enabled, you must specify the **-ssl** flag to scan port 443
```
nikto -h https://nmap.org -ssl
```

 Nikto to Scan Multiple Web Servers
 ```
nikto -h IP_list.txt
```

##### Vulnerabilities
Nikto provides some information about the vulnerabilities that it uncovers during its scans. Some vulnerabilities are associated with an OSVDB number (an older Open Source Vulnerability Database), a CWE [(Common Weakness Enumeration](https://cwe.mitre.org/about/)), or a CVE ([Common Vulnerabilities and Exposures](https://cve.mitre.org/)). OSVDB was discontinued in 2016. You can use the CVE reference tool to translate the OSVDB identifier to a CVE entry so you can research the vulnerability further.

Use the National Vulnerability Database ([https://nvd.nist.gov](https://nvd.nist.gov)) to find additional information on the CVEs. In the References to Advisories, Solutions, and Tools section, follow the links to find the remediation measures needed to close each vulnerability.

Nikto can output the results of a scan in various formats including CSV, HTML, SQL, txt, and XML.
```
nikto -h 172.17.0.2 -o scan_results.htm
```

To specify a text file output format that is independent of the file extension, use the **-Format** flag.
```
nikto -h 172.17.0.2 -o scan_results.txt -Format csv
```

**TIP** The command **nikto -h 209.165.201.27 -o pp_nikto_scan.htm** will scan the 209.165.201.27 target and output the results to an HTML file called pp_nikto_scan.htm. HTML scan reports that are created by Nikto are very easy to read. The other options output text files or CSV-formatted files that are not easy to read, although the CSV-formatted files are easy to import into other applications that can create reports. The **-h IP_list.txt** option enables Nikto to scan multiple hosts in a single session, but it requires the -o (output) option to create a file of the scan results.
