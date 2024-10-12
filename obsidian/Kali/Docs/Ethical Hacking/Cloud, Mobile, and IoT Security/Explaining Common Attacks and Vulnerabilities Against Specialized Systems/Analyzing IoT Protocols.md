Analyzing IoT protocols is important for tasks such as reconnaissance as well as exploitation. On the other hand, in the IoT world, you will frequently encounter custom, proprietary, or new network protocols. Some of the most common network protocols for IoT implementations include the following:

- Wi-Fi
- Bluetooth and Bluetooth Low Energy (BLE)
- Zigbee
- Z-Wave
- LoraWAN
- Insteon
- Modbus
- Siemens S7comm (S7 Communication)

For instance, **_Bluetooth Low Energy (BLE)_** is used by IoT home devices, medical, industrial, and government equipment. You can analyze protocols such as BLE by using specialized antennas and equipment such as the Ubertooth One ([_https://greatscottgadgets.com/ubertoothone/_](https://greatscottgadgets.com/ubertoothone/)). BLE involves a three-phase process to establish a connection:

**Phase 1**. Pairing feature exchange

**Phase 2**. Short-term key generation

**Phase 3**. Transport-specific key distribution

BLE implements a number of cryptographic functions. It supports AES for encryption and key distribution exchange to share different keys among the BLE-enabled devices. However, many devices that support BLE do not even implement the BLE-layer encryption. In addition, mobile apps cannot control the pairing, which is done at the operating system level. Attackers can scan BLE devices or listen to BLE advertisements and leverage these misconfigurations. Then they can advertise clone/ fake BLE devices and perform on-path (formerly known as man-in-the-middle) attacks.

In some cases, IoT proprietary or custom protocols can be challenging. Even if you can capture network traffic, packet analyzers like Wireshark often can’t identify what you’ve found. Sometimes, you need to write new tools to communicate with IoT devices.

**TIP** Tools such as GATTacker ([_https://github.com/securing/gattacker_](https://github.com/securing/gattacker)) can be used to perform on-path attacks in BLE implementations. BtleJuice ([_https://github.com/DigitalSecurity/BtleJuice_](https://github.com/DigitalSecurity/BtleJuice)) is a framework for performing interception and manipulation of BLE traffic.

---

Practice - Analyzing IoT Protocols

**Q.** Pixel Paradise does not rely heavily on IoT devices yet, except for some security monitoring devices inside and outside their offices. However, Protego does have other clients that make heavy use of IoT systems. What makes managing and securing IoT systems challenging? (Choose all that apply.)

**A.** Three factors that add complexity to managing and securing IoT systems are additional complexity due to disparate hardware and software, the use of legacy technologies, and multiple vendors and integrators can operate in a single system.