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

Try Updating

```php
sudo apt update
```

Missing packages

```php
sudo apt-get install libxcb-xinerama0-dev
```
- https://packages.debian.org/sid/riscv64/libgl1-mesa-glx/download (Couldn't locate the file after looking in a few of the mirrors)


**Alternative Software:** _GNS3, short for Graphical Network Simulator 3_

or
- use it on a windows VM instead of kali. 
- docker image

```php

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

ARCH
- download: cisco academy
- mv packettracer.deb into `/home/z0d/.cache/yay/packettracer`

```php
yay -S packettracer
```
- you could have to start the install so it first makes the folder, then move the `.deb` file into the folder mentioned in the error message.

`ERROR: CiscoPacketTracer822_amd64_signed.deb was not found in the build directory and is not a URL.`

`error downloading sources: /home/z0d/.cache/yay/packettracer`

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
