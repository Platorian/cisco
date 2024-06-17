Install

Update system

Start dhcpcd
```
dhccpd
```

Update
```
pacman -Sy
```

Install
```
blackarch-install
```

Keyboard
```
loadkeys uk
```

Language
```
en_GB.UTF-8
```

After install: 
- Shut down and remove ISO
- Restart machine and insert guest additions
- Log in
- Upgrade guest additions

### Untested guest additions

To install VirtualBox Guest Additions 7 14 on Linux BlackArch, follow these steps: 
1. Start the virtual machine in which BlackArch is installed. 
2. In the virtual machine window, click on Devices > Insert Guest Additions CD image. 
3. If a dialogue box appears, click on “Run”. 
4. Enter your root password when prompted. 
5. Wait for the installation to complete. 
6. Once the installation is complete, click on Devices > Optical Drives > Remove disk from virtual drive. 
7. Open the terminal and switch to the root user account. 
8. Mount the VirtualBox Guest Additions ISO file by running the following command: mount /dev/cdrom /mnt 
9. Change to the mounted directory by executing the following command: cd /mnt 1
10. Install the necessary build tools by running the following command: pacman -S base-devel 
11. Change to the directory containing the VirtualBox Guest Additions installer by executing the following command: cd LinuxAdditions 
12. Install the Guest Additions by running the following command: ./VBoxLinuxAdditions.run 
13. Wait for the installation to complete. 
14. Once the installation is complete, reboot the virtual machine by running the following command: reboot 
15. After rebooting, the VirtualBox Guest Additions should be installed and working. You can check by opening the virtual machine window, going to the Devices menu, and checking if “Shared Clipboard” and “Drag and Drop” are enabled.

