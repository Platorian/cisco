**kernal not loaded error after logging in**

```sh
sudo apt update
```

```sh
sudo apt upgrade
```

Search if headers are installed
```sh
apt search linux-headers-$(uname -r)
```

Verify headers are installed
```sh
ls -l /usr/src/linux/linux-headers-$(uname -r)
```

```sh
apt list --upgradeable
```

Install headers
```sh
sudo apt install linux-headers-$(uname -r)
```

In virtualbox click to insert guest additions cd

**Doesn't start**

1. Click Enter
2. CTRL + ALT + F2

```sh
sudo apt update
```

```sh
sudo apt upgrade
```

```sh
sudo dpkg --configure -a
```

```sh
reboot
```

---
**beef**

Because of errors i had to install, the github version, and use install with sudo

Modify the default user pass
```sh
sudo vim config.yaml
```
- Inside the beef directory

Run beef
```sh
sudo ./beef
```

