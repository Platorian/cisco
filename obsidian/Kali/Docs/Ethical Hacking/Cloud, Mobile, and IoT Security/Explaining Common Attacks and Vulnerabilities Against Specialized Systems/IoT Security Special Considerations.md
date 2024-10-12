**Fragile Environment***

Many IoT devices (including sensors and gateways) have limited compute resources. Because of this lack of resources, some security features, including encryption, may not even be supported in IoT devices.

**Availability Concerns***

DoS attacks against IoT systems are a major concern.

**Data Corruption***

IoT protocols are often susceptible to input validation vulnerabilities, as well as data corruption issues.

**Data Exfiltration***

IoT devices could be manipulated by an attacker and used for sensitive data exfiltration.

---

Common IoT Vulnerabilities

The following are some of the most common security vulnerabilities affecting IoT implementations. Select each vulnerability for more information.

![[Pasted image 20240617120650.png]]

Default credentials and insecure default configurations are often concerns with IoT devices. For instance, if you do a search in Shodan.io for IoT devices (or click on the Explore section), you will find hundreds of IoT devices with default credentials and insecure configurations exposed on the Internet.

![[Pasted image 20240617120752.png]]

As mentioned earlier, some IoT devices do not provide support for encryption. Even if encryption is supported, many IoT devices fail to implement encrypted communications, and an attacker could easily steal sensitive information. The leakage of sensitive information is always a concern with IoT devices.

![[Pasted image 20240617120829.png]]

Often IoT vendors sell their products with hard-coded insecure configurations or credentials (including passwords, tokens, encryption keys, and more).

![[Pasted image 20240617120921.png]]

Many organizations continue to run outdated software and hardware in their IoT devices. In some cases, some of these devices are never updated! Think about an IoT device controlling different operations on an oil rig platform in the middle of the ocean. In some cases, these devices are never updated, and if you update them, you will have to send a crew to physically perform a software or hardware upgrade. IoT devices often lack a secure update mechanism.

---

Practice - Common IoT Vulnerabilities

**Q.** You are compiling a checklist of items that you will verify as part of the test of the Pixel Paradise networked video surveillance devices. What should you verify to ensure that the devices are secure? (Choose all that apply.)

**A.** To ensure that the video surveillance equipment, and other IoT devices, are secure, the devices should be capable of encrypted communications, default credentials and configurations should be changed, and the device software should be updatable as needed.

