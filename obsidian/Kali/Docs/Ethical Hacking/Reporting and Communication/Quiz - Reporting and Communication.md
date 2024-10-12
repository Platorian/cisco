
---

**Q.** Which industry-standard method has created a catalog of known vulnerabilities that provides a score indicating the severity of a vulnerability?

**A.** Vulnerability scanners rely heavily on catalogs of known vulnerabilities. The two catalogs of known vulnerabilities that a cybersecurity analyst should be familiar with are the Common Vulnerability Scoring System (CVSS), which provides a score from 0 to 10 that indicates the severity of a vulnerability, and Common Vulnerabilities and Exposures (CVE), which is a list of publicly known vulnerabilities, each assigned an ID number, description, and reference. OWASP WSTG is a comprehensive guide focused on web application testing. NIST SP 800-115 is a document to provide organizations with guidelines on planning and conducting information security testing.

---
---

**Q.** Which vulnerability catalog creates a list of publicly known vulnerabilities, each assigned an ID number, description, and reference?

**A.** Vulnerability scanners rely heavily on catalogs of known vulnerabilities. The two catalogs of known vulnerabilities that a cybersecurity analyst should be familiar with are Common Vulnerabilities and Exposures (CVE), which is a list of publicly known vulnerabilities, each assigned an ID number, description, and reference, and Common Vulnerability Scoring System (CVSS), which provides a score from 0 to 10 that indicates the severity of a vulnerability. OWASP WSTG is a comprehensive guide focused on web application testing. NIST SP 800-115 is a document to provide organizations with guidelines on planning and conducting information security testing.

---
---

**Q.** Match the CVSS metric group with the respective information.

**A.** 
![[Pasted image 20240619094244.png]]

---
---

**Q.** Which three items are included in the base metric group used by CVSS? (Choose three.)

**A.** CVSS uses three metric groups in determining scores. The Base metric group includes exploitability metrics (for example, attack vector, attack complexity, privileges required, user interaction) and impact metrics (confidentiality impact, integrity impact, availability impact).

---
---

**Q.** Which item is included in the environmental metric group used by CVSS?

**A.** CVSS uses three metric groups in determining scores. The Environmental metric group includes modified base metrics, confidentiality, integrity, and availability requirements.

---
---

**Q.** Which item is included in the temporal metric group used by CVSS?

**A.** CVSS uses three metric groups in determining scores. The Temporal metric group includes exploit code maturity, remediation level, and report confidence.

---
---

**Q.** Which tool can ingest the results from many penetration testing tools a cybersecurity analyst uses and help this professional produce reports in formats such as CSV, HTML, and PDF?

**A.** Dradis is a handy little tool that can ingest the results from many of the penetration testing tools a cybersecurity analyst uses and help this professional produce reports in formats such as CSV, HTML, and PDF.

---
---

**Q.** Match the description to the respective control category.

**A.** 

| Description                           | Control Category       |
| ------------------------------------- | ---------------------- |
| Key Rotation                          | Technical Control      |
| Input Sanitization                    | Technical Control      |
| Secure Software Deployment Life cycle | Operational Control    |
| Role-Based Access Control             | Administrative Control |
| Time-Of-Day Restrictions              | Administrative Control |
| Job Rotation                          | Administrative Control |
| Video Surveilance                     | Physical Control       |
| Biometric Controls                    | Physical Control       |


---
---

**Q.** Which two items are examples of technical controls that can be recommended as mitigations and remediation of the vulnerabilities found during a pen test? (Choose two.)

**A.** During a penetration testing engagement, the cybersecurity analyst should analyze the findings and recommend the appropriate remediation within the report, including technical, administrative, operational, and physical controls. Technical controls make use of technology to reduce vulnerabilities. Technical controls include system hardening, user input sanitization and query parameterization, multifactor authentication, process-level remediation, patch management, key rotation, certificate management, secrets management solution, and network segmentation.

---
---

**Q.** A recent pen-test results in a cybersecurity analyst report, including information on process-level remediation, patch management, and secrets management solutions. Which control category is represented by this example?


**A.** During a penetration testing engagement, the cybersecurity analyst should analyze the findings and recommend the appropriate remediation within the report, including technical, administrative, operational, and physical controls. Technical controls make use of technology to reduce vulnerabilities. Technical controls include system hardening, user input sanitization and query parameterization, multifactor authentication, process-level remediation, patch management, key rotation, certificate management, secrets management solution, and network segmentation.

---
---

**Q.** Which document provides several cheat sheets and detailed guidance on preventing vulnerabilities such as cross-site scripting, SQL injection, and command injection?

**A.** The use of input validation (sanitizing user input) best practices is recommended to mitigate and prevent vulnerabilities such as cross-site scripting, cross-site request forgery, SQL injection, command injection, XML external entities, and other vulnerabilities. OWASP provides several cheat sheets and detailed guidance on preventing these vulnerabilities.

---
---

**Q.** A cybersecurity analyst report should contain minimum password requirements and policies and procedures. These are examples that are included in which control category?

**A.** During a penetration testing engagement, the cybersecurity analyst should analyze the findings and recommend the appropriate remediation within the report, including technical, administrative, operational, and physical controls. Administrative controls are policies, rules, or training designed and implemented to reduce risk and improve safety. Examples of administrative controls are role-based access control (RBAC), secure software development life cycle, minimum password requirements, and policies and procedures.

---
---

**Q.** Which control category includes information on mandatory vacations and user training in the cybersecurity analyst report?

**A.** During a penetration testing engagement, the cybersecurity analyst should analyze the findings and recommend the appropriate remediation within the report, including technical, administrative, operational, and physical controls. Operational controls focus on day-to-day operations and strategies. Operational controls include job rotation, time-of-day restrictions, mandatory vacations, and user training.

---
---

**Q.** When creating a cybersecurity analyst report, which control category includes information concerning the access control vestibule?

**A.** Physical controls use security measures to prevent or deter unauthorized access to sensitive locations or material. Physical controls include access control vestibule, biometric controls, and video surveillance.

---
---

**Q.** Match the term to the respective description.

**A.** 
![[Pasted image 20240619100036.png]]

---
---

**Q.** Which kind of event is also called a "benign trigger"?

**A.** False positives are "false alarms" or "benign triggers." They are problematic because triggering unjustified alerts diminishes the value and urgency of real alerts.

---
---

**Q.** What kind of events diminishes the value and urgency of real alerts?

**A.** alse positives are situations in which a security device triggers an alarm, but no malicious activity or actual attack occurs. They are problematic because triggering unjustified alerts diminishes the value and urgency of real alerts.

---
---

**Q.** Which kinds of events are malicious activities not detected by a network security device?

**A.** False negatives are malicious activities not detected by a network security device. False positives are situations in which a security device triggers an alarm, but no malicious activity or actual attack occurs. True positives are successfully identifying a security attack or a malicious event. True negatives occur when an intrusion detection device identifies an activity as acceptable behavior, and the activity is acceptable.

---
---

**Q.** Which kind of event occurs when an intrusion detection device identifies an activity as acceptable behavior and the activity is acceptable?

**A.** True negatives occur when an intrusion detection device identifies an activity as acceptable behavior, and the activity is acceptable. False negatives are malicious activities not detected by a network security device. False positives are situations in which a security device triggers an alarm, but no malicious activity or actual attack occurs. True positives are successfully identifying a security attack or a malicious event.

---
---

**Q.** Which kind of event is a successful identification of a security attack?

**A.** True positives are successful identification of security attacks or malicious events. True negatives occurs when an intrusion detection device identifies an activity as acceptable behavior, and the activity is actually acceptable. False negatives are malicious activities that are not detected by a network security device. False positives are situations in which a security device triggers an alarm but there is no malicious activity or actual attack taking place.

---
---

**Q.** Which example of technical control is recommended to mitigate and prevent vulnerabilities such as cross-site scripting, cross-site request forgery, SQL injection, and command injection?

**A.** The use of input validation (user input sanitization) best practices is recommended to mitigate and prevent vulnerabilities such as cross-site scripting, cross-site request forgery, SQL injection, command injection, XML external entities, and other vulnerabilities.

---
---

**Q.** Which example of administrative controls enables administrators to control what users can do at both broad and granular levels?

**A.** Role-based access control (RBAC) is a control that bases access permissions on a specific role or function. Administrators grant access rights and permissions to roles. Each user is then associated with a role. Users can belong to multiple groups. RBAC enables to control what users can do at both broad and granular levels.

---
---

**Q.** A document entitled "Building an Information Technology Security Awareness and Training Program" succinctly defines why security education and training are so important for users. The document defines ways to improve the security operations of an organization. Which document is being described?

**A.** User training is an example of operational controls often allowing organizations to improve security operations. A user should have the training and provide written acknowledgment of rights and responsibilities before being granted access to information and information systems. The National Institute of Standards and Technology (NIST) published Special Publication 800-50, "Building an Information Technology Security Awareness and Training Program," which succinctly defines why security education and training are important.

---
---

**Q.** How is the score that CVSS provides interpreted?

**A.** Common Vulnerability Scoring System (CVSS), which was developed and is maintained by FIRST.org, provides a method for calculating a score for the seriousness of a threat. The scores are rated from 0 to 10, with 10 being the most severe.

---
---

**Q.** What control category does system hardening belong to?

**A.** Technical controls make use of technology to reduce vulnerabilities. System hardening is an example of technical control that can be recommended as mitigation and remediation of the vulnerabilities found during a pen test. System hardening involves applying security best practices, patches, and other configurations to remediate or mitigate the vulnerabilities found in systems and applications.

---
---

**Q.** 

**A.** 

---
---

**Q.** 

**A.** 

---
---

**Q.** 

**A.** 

---
---

**Q.** 

**A.** 

