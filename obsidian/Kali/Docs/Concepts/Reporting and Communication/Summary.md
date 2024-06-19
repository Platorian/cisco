![[Pasted image 20240619091422.png]]

This topic emphasized the importance of proper report writing and structuring, particularly in the context of penetration testing. Key points include:

- **Audience**: It is crucial to know your report's audience, considering who will receive and further distribute the report. It is vital to create an executive summary that caters to all technical levels.
- **Contents**: The report should cover executive summary, scope details, methodology, findings, remediation, conclusion, and an appendix. The findings section should adopt an industry-accepted risk rating like CVSS. This ensures the relevance of findings to the targeted business.
- **Storage Time and Secure Distribution**: Penetration test reports, which can be classified as top-secret, should only be distributed on a need-to-know basis. Both physical and digital copies should be strictly controlled to maintain confidentiality.
- **Note-Taking**: Constant documentation during testing is necessary for comprehensive reports. Screenshots, videos, and notes taken during the process can be essential in explaining complex findings.
- **Use of Tools**: Tools like Dradis can help organize findings and export them into various formats, making report writing more manageable, especially for extensive tests.
- **Common Themes/Root Causes**: Identifying common themes or root causes of vulnerabilities helps to understand the risk in a particular environment. Therefore, a quality report should contain a detailed root cause analysis for each vulnerability found.
- **Quality of Report**: The quality of the report directly impacts client satisfaction and future engagements. The report serves as a testament to the performed work and identified issues. Providing false positives or incomplete reports may lead to misallocated resources, damaging your professional reputation.

![[Pasted image 20240619091444.png]]

In a penetration testing engagement, findings are analyzed and appropriate remediation recommendations are made. These are categorized into technical, administrative, operational, and physical controls.

- **Technical controls** use technology to minimize vulnerabilities. These include system hardening, user input sanitization and query parameterization, multifactor authentication, password encryption, process-level remediation, patch management, key rotation, certificate management, secrets management solutions, and network segmentation (including microsegmentation).
- **Administrative controls** consist of policies, rules, or training to mitigate risk. They include role-based access control (RBAC), secure software development life cycle (SSDLC), minimum password requirements, and the establishment of cybersecurity policies and procedures.
- **Operational controls** focus on daily operations and strategies, implemented by people to ensure policy adherence. Examples are job rotation, time-of-day restrictions, mandatory vacations, and user training, including security awareness programs and education.
- **Physical controls** use security measures to deter unauthorized access to sensitive areas or materials. They include access control vestibules (mantraps), biometric controls, and video surveillance.

![[Pasted image 20240619091508.png]]

The final report is the key deliverable, outlining the activities, findings, and recommendations from the testing process. However, other communication channels with the client are important too, including primary contact, technical contacts, and emergency contacts. Poor management and ineffective identification of testing elements can lead to scope creep.

There are several communication triggers, including critical findings, status reports, and indicators of prior compromise. These triggers necessitate immediate or timely reporting to the client instead of waiting to include them in the final report.

Moreover, deescalation tactics, avoidance of false positives, and reporting of discovered criminal activities are essential aspects of communication.

The client may reprioritize testing goals based on the vulnerabilities and weaknesses found, requiring alterations in the testing activities.

The findings and recommendations section of the report is pivotal, providing the technical details needed by IT, information security, and development teams. The audience must be kept in mind when compiling the report; for example, a report for a web application penetration test will be primarily for the development engineers.

The report should include all necessary details to recreate and understand the issues, such as HTTP requests and responses, and proof of exploits. Screenshots of findings and detailed descriptions of their identification should be included, with sensitive information redacted as necessary.

![[Pasted image 20240619091530.png]]

This topic provides an overview of important steps to follow after delivering a penetration testing report to a client. A crucial phase in the aftermath of testing is the post-engagement cleanup. Throughout the testing, various tools and techniques have likely been employed, which could cause residual effects on the tested systems. It could range from the data entered by automated web vulnerability scanners into a web application's database, to residual files left behind from failed exploits. All of this information needs to be meticulously cleaned from the systems and databases, and a comprehensive list of all cleanup activities should be provided to the client or system owner. It is also vital to remove tester-created credentials, spawned shells, and any tools installed or used during the process.

Furthermore, there are several additional post-report delivery activities. The client's acceptance of the report and its related deliverables should be properly documented. Penetration testers should also critically analyze and present any lessons learned during the engagement. Follow-up actions, such as retesting different applications or systems, may be requested by the client and should be addressed within an agreed-upon timeframe. Clear attestation of findings is needed, demonstrating that the assessment was indeed performed and detailing the findings. Lastly, any client-sensitive data collected during the penetration test should be destroyed, in line with agreements made during the pre-engagement activities.

