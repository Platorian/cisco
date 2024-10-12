
---

**Q.** Which term is an essential characteristic of cloud computing as defined in NIST SP 800-145?

**A.** NIST SP 800-145 defines cloud computing as “a model for enabling ubiquitous, convenient, on-demand network access to a shared pool of configurable computing resources that can be rapidly provisioned and released with minimal management effort or service provider interaction.”  
  
The five essential characteristics of cloud computing are:  

- On-demand self-service
- Broad network access
- Resource pooling
- Rapid elasticity
- Measured service

---

---

**Q.** Which cloud technology attack method involves breaching the infrastructure to gather and steal information such as valid usernames, passwords, tokens, and PINs?

**A.** Credential harvesting is the act of gathering and stealing valid usernames, passwords, tokens, PINs, and any other types of credentials through infrastructure breaches.

---

---

**Q.** Which cloud technology attack method could exploit a bug in a software application to gain access to resources that normally would not be accessible to a user?

**A.** Privilege escalation is exploiting a bug or design flaw in a software or firmware application to access resources normally protected from an application or a user.

---

---

**Q.** Which term describes when a lower-privileged user accesses functions reserved for higher-privileged users?

**A.** Vertical privilege escalation occurs when a lower-privileged user accesses functions reserved for higher-privileged users (for example, a standard user accessing functions of an administrator).

---

---

**Q.** Which cloud technology attack method could a threat actor use to access a user or application account that allows access to more accounts and information?

**A.** In an account takeover attack, the threat actor gains access to a user or application account and uses it to access more accounts and information.

---

---

**Q.** Which tool could be used to find vulnerabilities that could lead to metadata service attacks?

**A.** Tools such as nimbostratus (https://github.com/andresriancho/nimbostratus) can be used to find vulnerabilities that could lead to metadata service attacks.

---

---

**Q.** Which cloud technology attack method could generate crafted packets to cause a cloud application to crash?

**A.** Threat actors can launch strategic DoS attacks against applications hosted in the cloud that could lead to resource exhaustion. For example, they can leverage a single-packet DoS vulnerability in network equipment used in cloud environments, or they can leverage tools to generate crafted packets to cause an application to crash.

---

---

**Q.** Which cloud technology attack method would require the threat actor to create a malicious application and install it into a SaaS, PaaS, or IaaS environment?

**A.** In a cloud malware injection attack, the attacker creates a malicious application and injects it into a SaaS, PaaS, or IaaS environment. Once the malware injection is completed, the malware is executed as one of the valid instances running in the cloud infrastructure. Subsequently, the attacker can leverage this foothold to launch additional attacks, such as covert channels, backdoors, eavesdropping, data manipulation, and data theft.

---

---

**Q.** What is a common cause of data breaches in attacks against misconfigured cloud assets?

**A.** Insecure permission configurations for cloud object storage services, such as Amazon’s AWS S3 buckets, often cause data breaches.

---

---

**Q.** A threat actor has compromised a VM in a cloud environment that shares the same physical hardware as non-compromised VMs. Which cloud technology attack method could now be used to exfiltrate credentials, cryptographic keys, and other sensitive information?

**A.** Side-channel attacks are often based on information gained from implementing the underlying computer system (or cloud environment) instead of a specific weakness in the implemented technology or algorithm.

---

---

**Q.** Which tool helps software developers and cloud consumers deploy applications in the cloud and use the resources that the cloud provider offers?

**A.** Cloud development kits (CDKs) help software developers and cloud consumers deploy applications in the cloud and use the resources that the cloud provider offers.

---

---

**Q.** Which mobile device vulnerability is targeted when a threat actor reverse engineers a mobile app to see how it creates and stores keys in the iOS Keychain?

**A.** An attacker could use static analysis or reverse engineering to see how applications create and store keys in the iOS Keychain.

---

---

**Q.** Which tool is an open-source framework used to test the security of iOS applications?

**A.** Needle is an open-source framework used to test the security of iOS applications. Drozer, APK Studio, and ApkX are Android testing tools.

---

---

**Q.** Match the Bluetooth Low Energy (BLE) phase to the description.

**A.** 
![[Pasted image 20240618082027.png]]

---

---

**Q.** Which option is a security vulnerability that affects IoT implementations?

**A.** Common IoT security vulnerabilities include:  

- Insecure defaults
- Plaintext communication and data leakage
- Hard-coded configurations
- Outdated firmware/hardware and the use of insecure or outdated components

---

---

**Q.** Which two IoT systems should never be exposed to the Internet? (Choose two.)

**A.** Many IoT, ICS, and SCADA systems should never be exposed to the Internet. For example, programmable logic controllers (PLCs) controlling turbines in a power plant, stadium lighting, and factory robots should never be exposed to the Internet.

---

---

**Q.** Which option is a collection of compute interface specifications designed to offer management and monitoring capabilities independently of the CPU, firmware, and operating system of the host?

**A.** The Intelligent Platform Management Interface (IPMI) is a collection of compute interface specifications (often used by IoT systems) designed to offer management and monitoring capabilities independently of the host system’s CPU, firmware, and operating system.

---

---

**Q.** A threat actor uploaded a VM with malicious software to the VMware Marketplace. When an organization deploys the VM, the threat actor can manipulate the systems, applications, and user data. What type of VM vulnerability has been enabled?

**A.** A VM repository vulnerability is when a threat actor has found a way to upload fake or impersonated VMs with malicious software and backdoors. These ready-to-use VMs are deployed by many organizations, allowing the threat actor to manipulate the systems, applications, and data of the user.

---

---

**Q.** Which tool is a set of open-source analysis tools that uses the ClamAV antivirus engine to help detect vulnerabilities, Trojans, backdoors, and malware in Docker images and containers?

**A.** Dagda is a set of open-source static analysis tools that can help detect vulnerabilities, Trojans, backdoors, and malware in Docker images and containers. It uses the ClamAV antivirus engine to detect malware and vulnerabilities.

---

---

**Q.** Which credential harvesting tool could be used to send a spear phishing email with a link to a malicious site to a target victim?

**A.** The Social-Engineer Toolkit (SET) can perform a social engineering attack and instantiate a fake website to perform a credential harvesting attack.

---

---

**Q.** Why do cloud architectures help minimize the impact of DoS or DDoS attacks compared to hosting services on-premise?

**A.** One of the benefits of leveraging cloud services is the distributed and resilient architecture that most leading cloud providers offer. This architecture helps minimize the impact of a DoS or distributed denial-of-service (DDoS) attack compared to what it would be if you were hosting your application on-premises in your data center.

---

---

**Q.** Which option is a characteristic of a VM hypervisor?

**A.** There are two types of hypervisors:  

- Type 1 hypervisors (native or bare-metal hypervisors) run directly on the physical (bare-metal) system. Examples of Type 1 hypervisors include VMware ESXi, Proxmox Virtual Environment, Xen, and Microsoft Hyper-V.
- Type 2, or hosted, hypervisors run on top of other operating systems. Examples of type 2 hypervisors include VirtualBox and VMware Player or Workstation.

---

---

**Q.** A threat actor has compromised a VM in a data center and discovered a vulnerability that provides access to data in another VM. What type of VM vulnerability has been discovered?

**A.** VM escape vulnerabilities allow a threat actor to “escape” the VM and obtain access to other virtual machines on the system or access to the hypervisor.

---

---

**Q.** Which tool can be used to perform on-path attacks in BLE implementations?

**A.** Tools such as GATTacker can be used to perform on-path attacks in Bluetooth Low-Energy (BLE) implementations.

---

---

**Q.** Which tool is an open-source container vulnerability scanner that can be used to find vulnerabilities in a Docker image?

**A.** Anchore’s Grype is an open-source container vulnerability scanner that can be used to find vulnerabilities in a Docker image.

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

---

---

**Q.** 

**A.** 

---
