**Protego Security Solutions**

Cloud computing provides a lot of benefits to organizations. However, it is complex, and can be costly if not monitored carefully. Cloud services and accompanying technologies such as Kubernetes and Terraform, are new to many people in IT, and there is a shortage of people who are experts in cloud engineering. In addition, it is relatively easy to create cloud resources and also easy to lose track of them. It is completely possible that out-of-date software that is reachable in the cloud has been forgotten by cloud administrators.

Some providers of cloud software give their developers rights to configure cloud software resources for the testing of code. With so many people with limited expertise able to configure cloud resources, errors in configuration are bound to happen.

Because the cloud is relatively new, and some cloud concepts are pretty abstract, it is important for you to be familiar with it in order to conduct vulnerability scans and understand the results and remediation measures.

---

Many organizations are moving to the cloud or deploying hybrid solutions to host their applications. Organizations moving to the cloud are almost always looking to transition from capital expenditure (CapEx) to operating expenditure (OpEx). Most Fortune 500 companies operate in a multicloud environment. It is obvious that cloud computing security is more important today than ever before. Cloud computing security includes many of the same functionalities as traditional IT security, including protecting critical information from theft, data exfiltration, and deletion, as well as privacy.

The National Institute of Standards and Technology (NIST) authored Special Publication (SP) 800-145, “The NIST Definition of Cloud Computing,” to provide a standard set of definitions for the different aspects of cloud computing. The SP 800-145 document also compares the different cloud services and deployment strategies. The advantages of using a cloud-based service include the following:

- Distributed storage
- Scalability
- Resource pooling
- Access from any location
- Measured service
- Automated management

According to NIST, the essential characteristics of cloud computing include the following:

- On-demand self-service
- Broad network access
- Resource pooling
- Rapid elasticity
- Measured service

Cloud deployment models include the following:

- **Public cloud:** Open for public use
- **Private cloud:** Used just by the client organization on premises or at a dedicated area in a cloud provider
- **Community cloud:** Shared between several organizations
- **Hybrid cloud:** Composed of two or more clouds (including on-prem services)

Cloud computing can be broken into the following three basic models:

![[Pasted image 20240617075059.png]]

IaaS is a cloud solution in which you rent infrastructure. You purchase virtual power to execute your software as needed. This is much like running a virtual server on your own equipment, except that you run a virtual server on a virtual disk. IaaS is similar to a utility company model in that you pay for what you use.

![[Pasted image 20240617075205.png]]

PaaS provides everything except applications. Services provided by this model include all phases of the systems development life cycle (SDLC) and can use application programming interfaces (APIs), website portals, or gateway software. These solutions tend to be proprietary, which can cause problems if the customer moves away from the provider’s platform.

![[Pasted image 20240617075302.png]]

SaaS is designed to provide a complete packaged solution. The software is rented out to the user. The service is usually provided through some type of front end or web portal. While the end user is free to use the service from anywhere, the company pays a per-use fee.

_**NOTE** NIST Special Publication 500-292, “NIST Cloud Computing Reference Architecture,” is another resource for learning more about cloud architecture.

Many attacks against cloud technologies are possible, and the following are just some of them:

- Credential harvesting
- Privilege escalation
- Account takeover
- Metadata service attacks
- Attacks against misconfigured cloud assets
- Resource exhaustion and denial-of-service (DoS) attacks
- Cloud malware injection attacks
- Side-channel attacks
- Direct-to-origin attacks

The following sections provide details about each of these attacks against cloud-based services and infrastructures.

---
Practice - Types of Cloud Services

**Q.** Pixel Paradise uses a cloud model in which each game instance is running on its own virtual machine in the cloud. They want to change the model to one in which users subscribe to their games for various periods of time. Which model are they are they looking to adopt?

**A.** SaaS 
- Software as a Service (SaaS) is designed to provide on-demand, ready-to-use cloud-hosted application software.
- Infrastructure as a Service (IaaS) is a cloud solution in which a company rents infrastructure, such as servers, storage, networks, and virtualization.
- Platform as a Service (PaaS) is a cloud solution providing on-demand access to a complete, ready-to-use cloud-hosted platform, including website portals.