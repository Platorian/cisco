## Getting Started

View the [Basic Configuration w Auth](#1.-Basic-Configuration)

### Disclaimer

This wiki is not guaranteed to be correct, use at your own risk.

# 1. Basic Configuration

## Initial Commands

Commands to bu run right after a fresh boot with no configuration

**Change Hostname:**

```cmd
> enable
# configure terminal
(config)# hostname [newhostname]
(config)# exit
```

**Set IP address & enable interface:**

```
(config)# interface g0/0
(config-if)# ip address [ip-address] [subnet]
(config-if)# no shutdown
```

**Check interfaces**

```
# show ip interface brief
```
 
**Disable DNS lookup:**

```
(config)# no ip domain-lookup
```

# 2. Authentication

**Enable Secret:**

The user will be prompted to enter this password when entering enable mode

```
(config)# enable secret [newsecret]
```

**Set password for vty & comm-port login:**

VTY:

```
> enable
# configure terminal
```

Allow 16 different connections (0 to 16)

```
(config)# line vty 0 15
(config-line)# login local
```

Alternatively one universal password (not recommended):

```
(config-line)# login password [newpass]
(config-line)# exit
```

COM-PORT:

```
> enable
# configure terminal
(config)# line con 0
(config-line)# login local
(config-line)# exit
```

Add the local user:

```
(config)# username admin secret [newpasswd]
(config)# exit
```

**Save Config:**

```
# copy running-config startup-config
# show startup-config
```

# 3. Static Routing

##  Configure a static route

![Example](https://raw.githubusercontent.com/metrafonic/Cisco-Cheatsheet/master/images/Screenshot%20from%202015-06-30%2017%3A10%3A41.png)

It is important to remember that in a scenario where you may not need to add a static route on your gateway router to access a different router, you will most likely need to configure a route back to the client. The remote router will need a route to your internal subdomain via your access router.

**Recursive**

```
(config)# ip route [nettID] [subnet] [router ip to use]
```

**Directly Connected**

```
(config)# ip route [ip-address] [subnet] [interface]
```

**Set a default route**

```
(config)# ip route 0.0.0.0 0.0.0.0 [gateway router]
```

**Check route**

```
# show ip route
```

# 4. EIGRP & OSPF Routing

## EIGRP:
###  EIGRP Usage
![Example](https://raw.githubusercontent.com/metrafonic/Cisco-Cheatsheet/master/images/Screenshot%20from%202015-06-30%2017%3A59%3A23.png)

[**Download EIGRP Example**](https://github.com/metrafonic/Cisco-Cheatsheet/blob/master/Packet%20Tracer/EIGRP.pkt)

In the example above, we have four routers connected together via switches, with two end devices added to the mix. To make the job of setting up routing on this network much easier, we use EIGRP. Router 10 would in this example, advertise its neighbours to the rest of the network, so that a topology can be built. These adjacent networks to be advertised must be set manually, otherwise it is almost completely automatic.

**Enable EIGRP**

```
# configure teminal
(config)# router eigrp [autonomous-system-number]
(config-router)# router-id [ipv4-address]  //Not required
```

**Enable for adjacent subnets**

Replace nettID with the subnets the router is directly connected to, this will often be more than one. Default is a /16 subnet when no subnet is given:

```
(config-router)# network [nettID] [wildcard mask]
```

To find the inverted subnet, calculate 255.255.255.255 minus your given subnet

**Example:**

In the example above, router 10 would have the following:

```
# configure teminal
(config)# router eigrp 10
(config-router)# network 192.168.1.0 0.0.0.255
(config-router)# network 192.168.2.0 0.0.0.255
```

As neighbours are added, a prompt will display on screen alerting the user of the neighbours

### Verify EIGRP Routing

**View Neighbors**

```
# show ip eigrp neighbors
```

**View ip EIGRP routing table**

```
# show ip route eigrp
```

**View EIGRP topology table**

```
# show ip eigrp topology
```

**Verify EIGRP routing parameters**

```
# show ip protocols
```

### Modifying Bandwidth

Useful for checking the functionality of your setup.

```
# interface [interface]
# bandwidth [Kbit/sec]
```

### Configure passive interfaces

Useful to use on the interface to be used on the client side, to avoid MITM attacks.

```
# router eigrp [used AS number]
(config-router)# passive-interface [interface]
```
### Remove EIGRP

```
(config)# no router eigrp [autonomous-system-number]
```

## OSPF:

Guide can be found here:
https://www.petri.com/how-to-configure-ospf-in-cisco-ios

# 5. DHCP Configuration

### IP relaying of DHCP (IPHELPER)

![Example](https://raw.githubusercontent.com/metrafonic/Cisco-Cheatsheet/master/images/Screenshot%20from%202015-06-30%2020%3A07%3A32.png)

**Challenge** I have not managed to figure out how this can be done to request an ip over multiple routers. As of right now i am only able to do this on a router that is connected to both subnets directly. In the topology above, we have one DHCP server in the middle, three relays and three clients, though only two of the relay servers work correctly.

**Enable IPHELPER on router**

```
# conf t
(config)# int [interface to relay to]
(config-if)# ip helper [dhcp server address]
```

**Check IPHELPER configuration**

```
# show ip int [interface]
```

### DHCP Server Configuration

**Creating the pool**

```
(config)# ip dhcp pool [nameofpool]
(dhcp-config)# network [nettID] [subnet]
```

Note that the nettID where the client request is coming from will be checked against the nettID and subnet set here. if the two do not match, an address will not be allocated.

```
(dhcp-config)# default-router [dafault router]
(dhcp-config)# dns-server [dafault dns]
(dhcp-config)# domain-name [example.com]
(dhcp-config)# lease [days]
(dhcp-config)# exit
```

**Excluding Addresses**

```
(config)# ip dhcp exluded-address [start reserved ip] [end reseved ip]
```

### Debugging

**View DHCP address leases**

```
# show ip dhcp binding
```

**View DHCP pool statistics**

```
# show ip dhcp server statistics
```

**View DHCP pool settings**

```
# show ip dhcp pool
```

# 6. IPV6 Configuration

### Enabling IPv6
**Initialize IPv6**

```
# conf t
(config)# ipv6 unicast-routing
```

**Configure an address on an interface**

```
(config)# interface [interface]
(config-if)# ipv6 address [ipv6 prefix]/[prefix length] eui-64
(config-if)# ipv6 address [link-local] link-local //not required
(config-if)# no shutdown
(config-if)# exit
```

Note, the ipv6 prefix will look like a netid will usually end in 0, the wui-64 command allocates the unique portion of the computer to the address. This in a whole will be the same as witing  
**Example:**

```
(config-if)# ipv6 address 2001:DB8:ACAD:A::/64 eui-64
```

### IPv6 Routing:
**Static Route**

```cmd
(config)# ipv6 route [ipv6 prefix]/[prefix length] [next hop ipv6 address]
```

**Default IPv6 static route**

```cmd
(config)# ipv6 route ::/0 [interface]
```

**EIGRP Dynamic Routing**

Enable ipv6 routing:

```cmd
(config)# ipv6 unicast-routing
```

Start eigpr protocol

```cmd
(config)# ipv6 router eigrp [AS-number]
```

Configure EIGRP for a 32-bit address for the router ID.

```cmd
(config-rtr)# eigrp router-id [32 bit ip id] //feks 1.1.1.1
```

Enable:

```cmd
(configure-rtr)# no shutdown
```

# 7. NAT Protocol Mapping

In progress

# 8. Password Recovery 

In progress

# 9. Telnet & SSH Configuration

### Adding telnet access

Configure an admin user and password with level 15 access:

```cmd
(config)# username admin priv 15 secret cisco
```

Enable telnet access for a variable number of sessions:

```cmd
(config)# line vty 0 [number of sessions]
(config-line)# login local
(config-line)# end
```

### Enable SSH

Set a domain name:

```cmd
ip domain-name [domain.no]
```

Generate keys:

```cmd
R1(config)# crypto key gen rsa
```

Set time if time sync error appears:

```cmd
#clock set 13:00:00 2 JUL 2015
```

Update ssh version:

```cmd
(config)# ip ssh version 2
```

Connect from client.

# 10. Configuration Backup & Restore

Backup to tftp

```cmd
#copy running-config tftp:
```

Restore from tftp:

```cmd
#copy tftp: running-config
```

---

## My Cheatsheet

## General Commands

Enter privilege exec mode
```ios
enable
```

Return to user EXEC mode
```ios
disable
```

Enter global configuration mode
```ios
configure terminal
```

Exit global configuration mode
```ios
exit
```

Enter line subconfiguration mode for the console port
```ios
line console 0
```

Enter VTY line subconfiguration mode
```ios
line vty 0 15
```

Enter the VLAN 1 interface subconfiguration mode
```ios
interface vlan 1
```

From interface configuration mode, switch to line console subconfiguration mode using the **line console 0** global configuration command
```ios
line console 0
```

Return to privileged EXEC mode using the **end** command
```ios
end
```

**Show Commands**

Verifies the current configuration and settings
```ios
show running-config
```

Verifies the interface status and displays any error messages
```ios
show interfaces
```

Verifies the Layer 3 information of an interface
```ios
show ip interface
```

Verifies the list of known hosts on the local Ethernet LAN
```ios
show arp
```

Verifies the Layer 3 routing information
```ios
show ip route
```

Verifies which protocols are operational
```ios
show protocols
```

Verifies the memory, interfaces, and licenses of the device
```ios
show version
```

## Basic Switch Configuration

Configure the device name
```ios
hostname <name>
```

Secure user EXEC mode
```ios
line console 0
```

```ios
password <password>
```

```ios
login
```

Secure remote Telnet / SSH access
```ios
line vty 0 15
```

```ios
password <password>
```

```ios
login
```

Secure privileged EXEC mode
```ios
enable secret <password>
```

Secure all passwords in the config file
```ios
service password-encrytion
```

Provide legal notification
```ios
banner motd $ <message> $
```
- hit enter after the first delimiter, add the message, hit enter again, and then end with the final delimiter: `$` 

Configure the management SVI
```ios
interface vlan 1
```

```ios
ip address <ip> <subnet-mask>
```

```ios
no shutdown
```
- enables the interface

To access the switch remotely, an IP address and a subnet mask must be configured on the switch virtual interface (SVI). To configure an SVI on a switch, use the **interface vlan 1** global configuration command. Vlan 1 is not an actual physical interface but a virtual one.

After the switch is configured with these commands, the switch has all the IPv4 elements ready for communication over the local network.

Save the configuration
```ios
copy running-config startup-config
```

## Configure Initial Router Settings

The following tasks should be completed when configuring initial settings on a router.

**Step 1.** Configure the device name

```ios
hostname <name>
```

**Step 2.** Secure privileged EXEC mode

```ios
enable secret <password>
```

**Step 3.** Secure user EXEC mode

```ios
line console 0
```

```ios
password <password>
```

```ios
login
```

**Step 4.** Secure remote Telnet / SSH access

```ios
line vty 0 4
```

```ios
password <password>
```

```ios
login
```

```ios
transport input <ssh | telnet | none | all>
```

By default, many Cisco switches support up to 16 vty lines that are numbered 0 to 15. The number of vty lines supported on a Cisco router varies with the type of router and the IOS version. However, five is the most common number of vty lines configured on a router.

To verify that the passwords are set correctly, use the **show running-config** command

**Step 5.** Secure all passwords in the config file

In global configuration mode
```ios
service password-encryption
```

**Step 6.** Provide legal notification

```ios
banner motd $ <message> $
```

alternative command without using enter

```ios
banner motd #Authorized Access Only!#
```

**Step 7.** Save the configuration

```ios
copy running-config startup-config
```

## Enable SSH

**Step 1. Verify SSH support.**

Use the **show ip ssh** command to verify that the switch supports SSH. If the switch is not running an IOS that supports cryptographic features, this command is unrecognized.

**Step 2. Configure the IP domain.**

Configure the IP domain name of the network using the **ip domain-name** _domain-name_ global configuration mode command. In the example configuration below, the _domain-name_ value is **cisco.com**.

**Step 3. Generate RSA key pairs.**

Not all versions of the IOS default to SSH version 2, and SSH version 1 has known security flaws. To configure SSH version 2, issue the **ip ssh version 2** global configuration mode command. Generating an RSA key pair automatically enables SSH. Use the **crypto key generate rsa** global configuration mode command to enable the SSH server on the switch and generate an RSA key pair. When generating RSA keys, the administrator is prompted to enter a modulus length. The sample configuration in the figure uses a modulus size of 1,024 bits. A longer modulus length is more secure, but it takes more time to generate and to use.

**Note**: To delete the RSA key pair, use the **crypto key zeroize rsa** global configuration mode command. After the RSA key pair is deleted, the SSH server is automatically disabled.

**Step 4. Configure user authentication.**

The SSH server can authenticate users locally or use an authentication server. To use the local authentication method, create a username and password pair with the **username** _username_ **secret** _password_ global configuration mode command. In the example, the user **admin** is assigned the password **ccna**.

**Step 5. Configure the vty lines.**

Enable the SSH protocol on the vty lines using the **transport input ssh** line configuration mode command. The Catalyst 2960 has vty lines ranging from 0 to 15. This configuration prevents non-SSH (such as Telnet) connections and limits the switch to accept only SSH connections. Use the **line vty** global configuration mode command and then the **login local** line configuration mode command to require local authentication for SSH connections from the local username database.

**Step 6. Enable SSH version 2.**

By default, SSH supports both versions 1 and 2. When supporting both versions, this is shown in the **show ip ssh** output as supporting version 1.99. Version 1 has known vulnerabilities. For this reason, it is recommended to enable only version 2. Enable SSH version using the **ip ssh version 2** global configuration command.

Step 1. Verify SSH support
```ios
show ip ssh
```

Step 2. Configure the IP domain
```ios
configure terminal
```

```ios
ip domain-name cisco.com
```

Step 3. Generate RSA key pairs
```ios
crypto key generate rsa
```

Step 4. Configure user authentication
```ios
username admin secret ccna
```

Step 5. Configure the vty lines
```ios
line vty 0 15
```

```ios
transport input ssh
```

```ios
login local
```

```ios
exit
```

Step 6. Enable SSH version 2
```ios
ip ssh version 2
```

```ios
exit
```

display the version and configuration data for SSH on the device that you configured as an SSH server, use the **show ip ssh** command
```ios
show ip ssh
```

check the SSH connections to the device, use the **show ssh** command
```ios
show ssh
```

## Configure the Default Gateway

To connect to and manage a switch over a local IP network, it must have a switch virtual interface (SVI) configured. The SVI is configured with an IPv4 address and subnet mask on the local LAN. The switch must also have a default gateway address configured to remotely manage the switch from another network.

To configure an IPv4 default gateway on a switch, use the **ip default-gateway** _ip-address_ global configuration command. The _ip-address_ that is configured is the IPv4 address of the local router interface connected to the switch.

Enter global configuration mode
```ios
enable
```

```ios
configure terminal
```

Configure default gateway
```ios
ip default-gateway <ip>
```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```


```ios

```

