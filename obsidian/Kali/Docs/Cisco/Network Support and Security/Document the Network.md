
| Device   | Interface | Device Type (router, switch, host) | IP Address    | Subnet Mask     | Default Gateway |
| -------- | --------- | ---------------------------------- | ------------- | --------------- | --------------- |
| PC1      | NIC       | Host                               | 192.168.1.153 | 255.255.255.0   | 192.168.1.1     |
| PC2      | NIC       | Host                               | 192.168.3.50  | 255.255.255.0   | 192.168.3.1     |
| PC3      | NIC       | Host                               | 192.168.4.115 | 255.255.255.0   | 192.168.4.1     |
| PC4      | NIC       | Host                               | 192.168.5.83  | 255.255.255.0   | 192.168.5.1     |
| PC5      | NIC       | Host                               | 192.168.5.227 | 255.255.255.128 | 192.168.5.129   |
| PC6      | NIC       | Host                               | 192.168.2.48  | 255.255.255.224 | 192.168.2.33    |
| PC7      | NIC       | Host                               | 198.168.2.67  | 255.255.255.224 | 192.168.2.65    |
| Branch-1 |           | Router                             | 192.168.1.1   |                 |                 |
| SW-B1    |           | Switch                             | 192.168.1.252 | 255.255.255.0   | 192.168.1.1     |
| Hub      |           | Router                             | 192.168.0.1   |                 |                 |
|          |           |                                    |               |                 |                 |
|          |           |                                    |               |                 |                 |



DNS Server - 192.168.5.252

1. Telnet into service 
2. Enable admin mode
3. Check version for device details
4. Discover neighbours
5. Show IP route
6. Show IP interface brief
7. Show cdp neighbors detail
8. Add serial interface for connection to router (Hub)
9. Telnet into switch and show running config to find what vlan the address is on
10. Show IP interface brief to see where the PC should be connected
11. Connect to the hub on the 192.168.0.1 network to complete the diagram
12. Should be able to repeat the steps for the rest of the PCs


```php
telnet <IP>
```

```php
enable
```
- pass:class

```php
show version
```

```php
show cdp neighbors
```
- can get extra info by adding detail to the command

```php
show ip route connected
```
- remove connected for a more detailed view

![](img/router-img.png)
- this shows details of which wires are connected to what devices

```php
show ip interface breif
```

```php
show running-config
```

---

Subnet mask

|   |   |   |
|---|---|---|
|Prefix size|Network mask|Usable hosts per subnet|
|/1|128.0.0.0|2,147,483,646|
|/2|192.0.0.0|1,073,741,822|
|/3|224.0.0.0|536,870,910|
|/4|240.0.0.0|268,435,454|
|/5|248.0.0.0|134,217,726|
|/6|252.0.0.0|67,108,862|
|/7|254.0.0.0|33,554,430|
|**Class A**|   |   |
|/8|255.0.0.0|16,777,214|
|/9|255.128.0.0|8,388,606|
|/10|255.192.0.0|4,194,302|
|/11|255.224.0.0|2,097,150|
|/12|255.240.0.0|1,048,574|
|/13|255.248.0.0|524,286|
|/14|255.252.0.0|262,142|
|/15|255.254.0.0|131,070|
|**Class B**|   |   |
|/16|255.255.0.0|65,534|
|/17|255.255.128.0|32,766|
|/18|255.255.192.0|16,382|
|/19|255.255.224.0|8,190|
|/20|255.255.240.0|4,094|
|/21|255.255.248.0|2,046|
|/22|255.255.252.0|1,022|
|/23|255.255.254.0|510|
|**Class C**|   |   |
|/24|255.255.255.0|254|
|/25|255.255.255.128|126|
|/26|255.255.255.192|62|
|/27|255.255.255.224|30|
|/28|255.255.255.240|14|
|/29|255.255.255.248|6|
|/30|255.255.255.252|2|
|/31|255.255.255.254|0|
|/32|255.255.255.255|0|
