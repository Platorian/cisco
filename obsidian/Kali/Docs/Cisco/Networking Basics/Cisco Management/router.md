enter privileged exec mode
```php
enable
```

enter config mode
```php
configure
```

show interfaces ip4
```php
show ip interface brief
```
- ipv6 
```php
show ipv6 interface brief
```

show interface status
```php
show interfaces status
```

show route
```php
show ip route 
```

show only connected route
```php
show ip route connected
```

interface configuration mode
```php
interface g0/0/0
```
- `exit` = exit mode
- `?` = full list of commands

forward ipv6 packets
```php
ipv6 unicast-routing
```

setup addresses: 
ipv6
```php
ipv6 address 2001:db8:1:1::1/64
```

link local
```php
ipv6 address fe80::1 link-local
```

activate interface
```php
no shutdown
```

verify addresses 
```php
show ipv6 interface brief  
```

remove address
- _note:_ you have to remove the unwanted address first.
```php
no ipv6 address 2001:db8:1:1::1/64
```

save config file into NVRAM
```php
copy running-config startup-config
```
- enter
or 
```php
copy run startup
```

show config
```php
show running-config
```
- supports tab completion
- `space bar` to scroll output

show neighbours
```php
show ipv6 neighbors
```

```php
show cdp neighbors
```

more detailed
```php
show cdp neighbors detail
```

clear neighbours
```php
clear ipv6 neighbors
```

Add password
```php
hostname Office-SW2
line con 0
password Cisco123
login
end
```

reboot 
```php
reload
```

show device type
```php
show version
```


