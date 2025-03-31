**Detection and Defence**

Tools: XArp
Install on the Windows VM
- Shows the IPs and MAC addresses of connected clients on the network

View network details:
```sh
ipconfig
```

```sh
arp -a
```

On our Kali machine we can run bettercap to see how XArp on the Windows machine responds.

Start bettercap
```sh
sudo bettercap -iface eth0
```

Check help menu
```sh
help
```

Get extended information on specific modules
```sh
help arp.spoof
```

Put spoof into full duplex mode so it interacts with both the access point and the Windows VM
```sh
set arp.spoof.fullduplex true
```

Manually set the target (the Windows VM)
```sh
set arp.spoof.targets <target-ip>
```

Start arp spoof
```sh
arp.spoof on
```

In Xarp on the Windows VM the status now should change to detect the attack:

![](img/xarp01.png)





















