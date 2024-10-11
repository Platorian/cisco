install
```php
sudo dpkg -i Packet_Tracer822_amd64_signed.deb
```

additional packages
```php
sudo apt install -f
```

or
```php
sudo apt --fix-broken install
```

The program throws errors and i found it difficult to install the dependencies, but if you just use the dpkg command it will install packet tracer into the /opt folder which you can run from the command line.

```php
cd /opt/pt
```

```php
./packettracer
```

add desktop shortcut
```php
cp /usr/share/applications/cisco-pt.desktop ~/Desktop
```

```php
chmod +x cisco-pt.desktop
```

---

The Cisco Internetwork Operating System (IOS) is an operating system used in Cisco networking devices. It allows creation of configurations that customize the operation of network devices in different network environments. The CLI is accessible via the device console port using terminal software or remotely via Secure Shell (SSH). Network administrators use a computer to access the device console in order to create or modify the device configuration.

Change hostname 

```php
enable
configure terminal
hostname Edge_Router_Backup
end
```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```
