Depending on the vulnerabilities and weaknesses that you find during a penetration testing engagement, your client may tweak or reprioritize the goal of the testing. Your client may prioritize some systems or applications that may not have been seen as critical. Similarly, your client might ask you to deprioritize some activities in order to focus on some goals that may now present a higher risk.

**TIP** The report is the final deliverable for a penetration test. It communicates all the activities performed during the test as well as the ultimate results in the form of findings and recommendations. The report is, however, not the only form of communication that you will have with a client during a penetration testing engagement. During the testing phases of the engagement, certain situations may arise in which you need to have a plan for communication and escalation.

The findings and recommendations section is the meat of a penetration testing report. The information provided here is what will be used to move forward with remediation and mitigation of the issues found in the environment being tested. Whereas earlier sections of the report, such as the executive summary, are purposely not too technical, the findings and recommendations section should provide all the technical details necessary that teams like IT, information security, and development need to use the report to address the issues found in the testing phase.

Remember that you must keep in mind your audience. For instance, if you are compiling a report for a web application penetration test, your ultimate audience for this section will likely be the development engineers who are responsible for creating and maintaining the application being tested. You will therefore want to provide a sufficient amount of information for them to be able to re-create the issue and identify exactly where the code changes need to be applied. Let’s say that during your testing, you found an SQL injection flaw. In the report, you then need to provide the actual HTTP request and response you used to uncover that flaw. You also need to provide proof that the flaw is not a false positive. Ideally, if you are able to exploit the SQL injection flaw, you should provide a screenshot showing the results of your exploitation. If this is sensitive information from an exploited database, you should redact the screenshot in a manner that is sufficient to limit the sensitivity. Your report should provide screenshots of the various findings and detailed descriptions of how they were identified.
