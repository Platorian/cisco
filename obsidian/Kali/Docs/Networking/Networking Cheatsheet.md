### Definitions:

- **Network**: A collection of interconnected devices (computers, servers, etc.) that communicate and share resources.
- **Internet**: A global network that connects millions of private, public, academic, business, and government networks, enabling communication and information sharing.
- **Intranet**: A private network within an organization, restricted to authorized users, typically for internal communication and resource sharing.
- **Extranet**: An extension of an intranet that allows limited access to outsiders, typically for business partners or customers.

### Network Types:

- **Server-Bus**: A network where multiple devices are connected to a central server or hub, with communication occurring through the server.
- **Peer to Peer (P2P)**: A decentralized network where each device can act as both a server and a client, sharing resources directly with others.

### Topology:

- **Bus**: All devices are connected to a single central cable (the bus), with data sent to all devices.
- **Star**: Devices are connected to a central hub or switch, with each device having a direct connection to the hub.
- **Ring**: Devices are connected in a circular fashion, and data travels in one direction around the ring.
- **Mesh**: Devices are interconnected in a way that allows multiple paths between any two devices, offering high redundancy and reliability.

- **Fastest**: Mesh
- **Lowest cable consumption**: Bus
- **Hardest Troubleshooting**: Bus
- **Easiest Development**: Ring

### OSI and TCP/IP Layers:

1. **OSI Layers**:
   - **Application**: End-user protocols (e.g., HTTP, FTP).
   - **Presentation**: Data formatting, encryption, and compression.
   - **Session**: Manages sessions between devices.
   - **Transport**: Ensures reliable data transfer with segmentation and connection control (TCP/UDP).
   - **Network**: Routing and IP addressing.
   - **Data Link**: Physical addressing, error detection/correction.
   - **Physical**: Transmission of raw data over a physical medium.

2. **TCP/IP Layers**:
   - **Application**: Protocols for communication (e.g., HTTP, FTP, Email).
   - **Transport**: Manages end-to-end communication (TCP/UDP).
   - **Internet**: Responsible for routing (e.g., IP, ICMP, ARP).
   - **Network**: Deals with the transmission of data over physical networks (Ethernet, ATM).

### Class IP:

- **Class A**: 1 – 127 (Large networks).
- **Class B**: 128 – 191 (Medium networks).
- **Class C**: 192 – 223 (Small networks).
- **Class D**: 224 – 239 (Multicast addresses).
- **Class E**: 240 – 255 (Reserved for future use).

### Transmission Direction:

- **Bidirectional Synchronous**: Two-way communication with synchronized timing.
- **Bidirectional Asynchronous**: Two-way communication without synchronization.
- **Unidirectional**: One-way communication.

### Cloud Computing:

- **Data Center**: A facility used to house computing systems and associated components like storage, networking, and security systems.
  
  **Benefits**: 
   - Lower cost
   - Flexibility and scalability
   - Automatic updates
   - Unlimited capacity
  
  **Disadvantages**: 
   - Requires a stable internet connection
   - Relies on high-speed internet for optimal performance

1. **Infrastructure as a Service (IaaS)**: Provides virtualized computing resources over the internet.
2. **Platform as a Service (PaaS)**: Provides a platform allowing customers to develop, run, and manage applications.
3. **Software as a Service (SaaS)**: Software delivered over the internet on a subscription basis.

**Pyramids**:  
- **Infrastructure -> Platform -> Software** (Order of service layers).  
- **Edge -> Fog -> Cloud** (Levels of cloud computing architecture).

### Routing:

- **Static Routing**: Manual configuration, no dynamic adjustments, minimal overhead but lacks flexibility.
- **Dynamic Routing**: Uses algorithms (e.g., OSPF, IS-IS) to automatically adjust routes based on network changes.

**Classless and Classful**:
- **Classful**: Older system of IP addressing based on predefined classes (A, B, C).
- **Classless**: More flexible system using CIDR (Classless Inter-Domain Routing).

**Routing Types**:
- **Distance Vector**: Routers share routing tables, and updates happen periodically (e.g., RIP).
- **Link State**: Routers share network topology information, with updates every 30 minutes and use Dijkstra’s algorithm for routing decisions (e.g., OSPF).

### Hierarchical Network Design:

Hierarchical network design organizes a network into three layers, each with specific roles to enhance scalability, manageability, and performance.

1. **Core Layer**:  
   - Focuses on high-speed data transfer across the network backbone.  
   - Provides fault tolerance and redundancy to ensure reliability.  
   - Designed for fast transport with minimal latency.

2. **Distribution Layer**:  
   - Acts as a mediator between the core and access layers.  
   - Implements security policies, such as filtering and access control.  
   - Supports load balancing and enforces policies for traffic management.

3. **Access Layer**:  
   - The layer where end devices (like PCs and printers) connect to the network.  
   - Supports VLANs (Virtual LANs) for segmenting networks.  
   - Ensures Quality of Service (QoS) for critical applications.  
   - Provides Power over Ethernet (PoE) to power devices like IP phones and wireless access points.  

This hierarchical approach simplifies network management, improves performance, and enhances fault tolerance.

### Switching:

- **Switching**: The process of directing data from one device to another in a network.
  
  Types of Switching:
  - **Circuit Switching**: Establishes a dedicated path for the entire communication session.
  - **Message Switching**: Entire messages are sent from one point to another, stored and forwarded at intermediate nodes.
  - **Packet Switching**: Data is divided into packets and sent independently, with each packet potentially taking a different path.

### IP Headers:

![IP Headers](https://gist.githubusercontent.com/taiwbi/a2edcf2861f5ec168375443bd1ce351f/raw/513ba04aef394400de60af1d5d4496d2a4723c8e/IP-Header-table.svg)
- **Table of IP Headers**:  
  - **Version**: Protocol version (IPv4 or IPv6).
  - **IHL (Internet Header Length)**: Length of the header.
  - **Type of Service**: Specifies quality of service options.
  - **Total Length**: Entire packet size.
  - **Identification**: Unique packet identifier.
  - **Flags**: Control fragmentation.
  - **Fragment Offset**: Fragment position in original packet.
  - **Time to Live (TTL)**: Prevents packets from circulating indefinitely.
  - **Protocol**: Defines the protocol used in the payload (e.g., TCP, UDP).
  - **Header Checksum**: Error detection for the header.
  - **Source Address**: Sender's IP address.
  - **Destination Address**: Receiver's IP address.
  - **Option**: Optional data for additional features.


**Binary - Base 2 (0,1)**

| 2^7 | 2^6 | 2^5 | 2^4 | 2^3 | 2^2 | 2^1 | 2^0 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
|     |     |     |     |     |     |     |     |
What is **168** is binary?

| 2^7 | 2^6 | 2^5 | 2^4 | 2^3 | 2^2 | 2^1 | 2^0 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
| 1   | 0   | 1   | 0   | 1   | 0   | 0   | 0   |
128 + 32 + 8 = 168

Convert the number **01101101** to decimal

| 2^7 | 2^6 | 2^5 | 2^4 | 2^3 | 2^2 | 2^1 | 2^0 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
| 0   | 1   | 1   | 0   | 1   | 1   | 0   | 1   |
64 + 32 + 8 + 4 + 1 = 109

What is the binary of 192.168.10.11? We can also do it like this:
192

| 2^7 | 2^6 | 2^5 | 2^4 | 2^3 | 2^2 | 2^1 | 2^0 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
| 1   | 1   | 0   | 0   | 0   | 0   | 0   | 0   |

- is 192 >= 128 
- if it is 192 - 128 = 64
- is 64 >= 64 
- if it is 64 - 64
- no remainder so the rest are 0's

168

| 2^7 | 2^6 | 2^5 | 2^4 | 2^3 | 2^2 | 2^1 | 2^0 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
| 1   | 0   | 1   |     |     |     |     |     |

- is 168 >= 128 
- 168 - 128 = 40
- is 40 >= 64
- no, so add a 0
- is 40 >= 32 
- 40 - 32 = 12
- and so on

**Get the following IP and split it into 3 subnets: 192.168.4.0/24**

| subnet      | 1   | 2   | 4   | 8   | 16  | 32  | 64  | 128 | 265 |
| ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| host        | 256 | 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |
| subnet mask | /24 | /25 | /26 | /27 | /28 | /29 | /30 | /31 | /32 |

We can't get three subnets, so we use the column for 4 instead:

Original network ID: 192.168.4.0/24

| Network ID    | Subnet Mask | Host ID Range               | no. of Usable Hosts | Braodcast ID  |
| ------------- | ----------- | --------------------------- | ------------------- | ------------- |
| 192.168.4.0   | /26         | 192.168.4.1-192.168.4.63    | 62                  | 192.168.4.63  |
| 192.168.4.64  | /26         | 192.168.4.65-192.168.4.126  | 62                  | 192.168.4.127 |
| 192.168.4.128 | /26         | 192.168.4.129-192.168.4.190 | 62                  | 192.168.4.191 |
| 192.168.4.192 | /26         | 192.168.4.193-192.168.4.254 | 62                  | 192.168.4.255 |

