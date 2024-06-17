IoT implementations have suffered from many _management interface vulnerabilities_. For example, the **_Intelligent Platform Management Interface (IPMI)_** is a collection of compute interface specifications (often used by IoT systems) designed to offer management and monitoring capabilities independently of the host system’s CPU, firmware, and operating system. System administrators can use IPMI to enable out-of-band management of computer systems (including IoT systems) and to monitor their operation. For instance, you can use IPMI to manage a system that may be powered off or otherwise unresponsive by using a network connection to the hardware rather than to an operating system or login shell. Many IoT devices have supported IPMI to allow administrators to remotely connect and manage such systems.

An IPMI subsystem includes a main controller, called a baseboard management controller (BMC), and other management controllers, called satellite controllers. The satellite controllers within the same physical device connect to the BMC via the system interface called Intelligent Platform Management Bus/Bridge (IPMB). Similarly, the BMC connects to satellite controllers or another BMC in other remote systems via the IPMB.

The BMC, which has direct access to the system’s motherboard and other hardware, may be leveraged to compromise the system. If you compromise the BMC, it will provide you with the ability to monitor, reboot, and even potentially install implants (or any other software) in the system. Access to the BMC is basically the same as physical access to the underlying system.

---

Practice - Management Interface Vulnerabilities

**Q.** An organization is using IPMI to manage its server network. How does IPMI introduce vulnerabilities into the network?

**A.** The BMC component of IPMI, which has direct access to the system’s motherboard and other hardware, may be leveraged to compromise the system. If the BMC is compromised, it will allow an attacker to monitor, reboot, and install implants (or any other software) in the system. Access to the BMC is the same as physical access to the underlying system.

