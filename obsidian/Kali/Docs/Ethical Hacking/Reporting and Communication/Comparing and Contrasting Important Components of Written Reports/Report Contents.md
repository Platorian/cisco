There are many ways you can go about structuring the elements in a report. Most penetration testing consultants start with a template and customize it based on the type of test and the desired deliverable. Keep in mind that there are published standards that you can reference. This section takes a look at some examples of the elements that should be included in a penetration testing report and discusses the level of detail that should be provided for each of these elements.

**TIP** Take some time to look at the excellent examples of penetration testing reports available at [_https://github.com/The-Art-of-Hacking/art-of-hacking/tree/master/pen_testing_reports_](https://github.com/The-Art-of-Hacking/art-of-hacking/tree/master/pen_testing_reports). These reports have been provided by various organizations for the purpose of sharing examples of penetration testing reports. A great way to use this resource is to browse through the sample reports and view the report formats. Take a look at how the reports are organized, including what is included in each of the sections. You can then build your own report format based on these examples and your specific needs.

A penetration testing report typically contains the following sections (which are not listed in a particular order). Select each for more detail.

**Executive Summary***

A brief high-level summary describes the penetration test scope and major findings.

**Scope Details***

It is important to include a detailed definition of the scope of the network and systems tested as part of the engagement to distinguish between in-scope and out-of-scope systems or segments and identify critical systems that are in or out of scope and explain why they are included in the test as targets.

**Methodology***

A report should provide details on the methodologies used to complete the testing (for example, port scanning, Nmap). You should also include details about the attack narrative. For example, if the environment did not have active services, explain what testing was performed to verify restricted access. Document any issues encountered during testing (for example, interference encountered as a result of active protection systems blocking traffic).

**Findings***

A report should document technical details about whether or how the system under testing and related components may be exploited based on each vulnerability found. It is a good idea to use an industry-accepted risk ratings for each vulnerability, such as the Common Vulnerability Scoring System (CVSS). When it comes to reporting, it can be difficult to determine a relevant method of calculating metrics and measures of the findings uncovered in the testing phases. This information is very important in your presentation to management. You must be able to provide data to show the value in your effort. This is why you should always try to use an industry-standard method for calculating and documenting the risks of the vulnerabilities listed in your report. CVSS has been adopted by many tools, vendors, and organizations. Using an industry standard such as CVSS will increase the value of your report to your client. CVSS, which was developed and is maintained by FIRST.org, provides a method for calculating a score for the seriousness of a threat. The scores are rated from 0 to 10, with 10 being the most severe. CVSS uses three metric groups in determining scores.

**Remediation***

You should provide clear guidance on how to mitigate and remediate each vulnerability. This information will be very useful for the IT technical staff, software developers, and security analysts who are trying to protect the organization (often referred to as the “blue team”).

**Conclusion***

The report must have a good summary of all the findings and recommendations.

**Appendix***

It is important to document any references and include a glossary of terms that the audience of the report may not be familiar with.

**NOTE** Vulnerability scanners rely heavily on catalogs of known vulnerabilities. The two catalogs of known vulnerabilities you need to be familiar with as a security analyst are Common Vulnerabilities and Exposures (CVE), which is a list of publicly known vulnerabilities, each assigned an ID number, description, and reference, and Common Vulnerability Scoring System (CVSS), which provides a score from 0 to 10 that indicates the severity of a vulnerability.

The following list gives you an idea of what is included in the metrics groups used to determine the overall CVSS score of a vulnerability. Select each for more information.

![[Pasted image 20240619051244.png]]

Includes exploitability metrics (for example, attack vector, attack complexity, privileges required, user interaction) and impact metrics (for example, confidentiality impact, integrity impact, availability impact).

![[Pasted image 20240619051302.png]]

Includes exploit code maturity, remediation level, and report confidence.

![[Pasted image 20240619051319.png]]

Includes modified base metrics, confidentiality, integrity, and availability requirements. CVSS includes different metrics and measures that describe the impact of each vulnerability. This risk prioritization can help your customer understand the business impact (business impact analysis) of the vulnerabilities that you found during the penetration testing engagement. You can find full explanations of the CVSS metric groups as well as details on how to calculate scores by accessing the Common Vulnerability Scoring System User Guide at [_https://www.first.org/cvss/user-guide_](https://www.first.org/cvss/user-guide).

**TIP** The Open Web Application Security Project (OWASP) publishes the Risk Rating Methodology to help with estimating the risk of a vulnerability as it pertains to a business. It is part of the OWASP Testing Guide, at [_https://owasp.org/www-project-web-security-testing-guide_](https://owasp.org/www-project-web-security-testing-guide).

---

Practice - Penetration Reporting

**Q.** You are working on your penetration test report. Your supervisor reads over the report and suggests that many of the vulnerabilities that you have found should be reported with their CVSS scores. What is the value of CVSS scores in a penetration test report?

**A.** The Common Vulnerabilities and Exposures (CVE) is a list of publicly known vulnerabilities; each is assigned an ID number, description, and reference. A Common Vulnerability Scoring System (CVSS) rating provides a score from 0 to 10 that indicates the severity of a vulnerability. CVSS provides industry-accepted standard severity ratings for each vulnerability. This enables the client to manage the risk of the vulnerability appropriately and consistently across all systems.

**Q.** The CVSS provides vulnerability ratings that are standard across all industries. Which CVSS metric group provides vulnerability ratings that are tailored to a specific organization's threat surface?

**A.** The environmental metric group provides risk prioritization that the client can use to understand the business impact (business impact analysis) of the vulnerabilities found to their own organization.

