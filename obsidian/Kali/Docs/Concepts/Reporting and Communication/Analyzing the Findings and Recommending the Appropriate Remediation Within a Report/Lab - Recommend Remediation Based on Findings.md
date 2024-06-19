
**Protego Security Solutions Task**

As you know, some vulnerability scanners provide links to reference materials and CVSS ratings. Some even allow filtering of results based on CVSS ratings so that only vulnerabilities that exceed a stated severity threshold will be displayed.

It is important to provide vulnerability ratings to your customers in some form. You should try to be as objective as possible. Using a standard rating system such as CVSS helps with this, but sometimes the vulnerability values lack context. Some pentesting organization use their own rating system that they can contextualize for the client depending on the nature of the business. However, if you do this, be sure to define the ratings and provide a rationale for the rating of individual vulnerabilities if greater clarity is required.

In this lab, you will complete the following objectives:

- Identify and prioritize vulnerabilities found on the DVWA server.
- Research and recommend mitigation strategies.

# Instructions

## Part 1: Identify and Prioritize Vulnerabilities Found on the DVWA Server

### Step 1: Scan a vulnerable host with Nikto and create a report.

Run a quick scan of the DVWA server using Nikto and output the results to an HTM file. A number of vulnerabilities were discovered.

┌──(kali㉿Kali)-[~]

└─$ **nikto -h 10.6.6.13 -o pentest.htm**

You can use this report to investigate vulnerabilities that were found on the target.

### Step 2: Perform a detail scan using GVM to further investigate the vulnerabilities on the server.

1. Start the GVM Dashboard to scan the DVWA server.

┌──(kali㉿Kali)-[/home/kali]

**└─# sudo gvm-start**

2. When the Firefox browser opens, login with the username **admin** and the password of **kali**.
3. Start a new task using the **Task Wizard** by clicking **Scans** from the menu bar and then selecting the **Task Wizard** from the magic wand icon on the top left of the scan window.
4. Enter the IP address **10.6.6.13** in the IP address or hostname field. Click **Start Scan**. The scan may take a few minutes, the status bar next to the scan name indicates the percent completed.

### Step 3: Research the risks associated with each vulnerability.

1. When the GVM scan completes, go to the **Scans** menu and select **Reports**. You should see the report for your last scan listed there.
2. Click the date and time entry for the task to view the report. Click the **Results** tab to view the results of your scan.
3. Click each vulnerability that was found to display the detailed information about the risks associated with the vulnerability.
4. Open the Nikto pentest.htm scan report file that was created in Step 1.
5. Use internet resources to further research the vulnerabilities that were discovered using Nikto and GVM. Fill in the table with the information that you found. Based on your research, assign a priority to mitigation efforts.

- Priority 1 vulnerabilities should be fixed immediately.
- Priority 2 vulnerabilities should be fixed but are less likely or more difficult to exploit.
- Priority 3 vulnerabilities are low risk and unlikely to be exploited.

![[Pasted image 20240619080235.png]]

## Part 2: Research and Recommend Mitigation Strategies

At the end of a penetration testing project, a report or series of reports are created to inform the stakeholders of the test results. One of the main components of the report is the suggested fixes to mitigate, or work-around, the identified vulnerabilities. In this part, you will research each of the critical vulnerabilities and identify the necessary remediation.

For each of the listed vulnerabilities, describe a suggested fix or mitigation strategy.

---

**Q.** What is your suggested fix for the **Operating System End-of-Life** vulnerability?

**A.** Update to the current supported version of the operating system and plan a means of keeping the OS up to date in the future.

**Q.** What is your suggested fix for the **Directory indexing found** vulnerability?

**A.** Add a blank index page in each web-accessible directory or disable the feature in the web server configuration file.

**Q.** What is your suggested fix for the **Cleartext Transmission of Sensitive Information via HTTP** vulnerability?

**A.** Use encryption protocols such as SSL/TLS or HTTPS to ensure data is encrypted in transit.

**Q.** What is your suggested fix for the **Missing “HttpOnly” Cookie Attribute (HTTP)** vulnerability?

**A.** Tag cookies with the HttpOnly flag which tells the browser that this particular cookie should only be accessed by the server.

**Q.** What is your suggested fix for the **anti-clickjacking X-Frame-Options header is not present** vulnerability?

**A.** Send the proper X-Frame-Options in HTTP response headers that instruct the browser to not allow framing from other domains. Employ defensive code in the UI to ensure that the current frame is the most top level window.

---

# Reflection

**Q.** Why is it important to use multiple methods to find vulnerabilities and misconfigurations in web servers?

**A.** Because not all vulnerability scanners use the same methodologies to uncover vulnerabilities. To get the most complete view of the device, it can be necessary to use multiple scanning tools.

---

**Q.** A vulnerability scan of the Pixel Paradise network discovered a **Missing "HTTPOnly" Cookie Attribute (HTTP)** vulnerability. What should you recommend be done to mitigate this vulnerability?

**A.** The **Missing "HTTPOnly" Cookie Attribute (HTTP)** vulnerability can be mitigated by configuring the server to tag cookies with the HTTPOnly attribute so that cookies can only be accessed by the server.

