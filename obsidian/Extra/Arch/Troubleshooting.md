**YT-dlp**

Change to audio:
```
yt-dlp -x --audio-format mp3 <url
yt-dlp -f bestaudio <url>
yt-dlp -x --audio-format best <url>
```

-list-formats

specific location:
```
yt-dlp -o '~/Downloads/Abdul Kalam Biography'
``` 

https://www.youtube.com/watch?v=t5b20oLaIaw

rename:
```
yt-dlp --output "custom_ﬁlename.mp4"
yt-dlp --output "custom_ﬁlename.%(ext)s"
```

full (untested) command for audio:
```
yt-dlp -x --audio-format mp3 -o '~/Videos/audiobook/' <url>
```
- may need to add the title and extension: %(ext)s ('~/Videos/audiobook/.%(ext)s')

best audio:
```
yt-dlp -f bestaudio <URL>
```

resume download:
```
yt-dlp -c <url>
```

---

**electron downloading chrome error**

check if it's required for anything in use 

```
pactree electron30
```

```
pacman -Qi electron30
```

remove file

```
pacman -R electron30
```

update as usual

```
pacman -Syyu
```

file location: remove any unwanted files that are part of electron

```
/home/username/.cache/yay/electron30/
```

---

**error with alacrity:**
- alacritty migarte
- check the log: /tmp/alacritty-39932.log ($ALACRITTY_LOG)

Successfully migrated import "/home/z0d/.config/alacritty/colors.toml"
Successfully migrated import "/home/z0d/.config/alacritty/fonts.toml"
Successfully migrated "/home/z0d/.config/alacritty/alacritty.toml"

notes: 
- moved to the top - import and live-config-reload
- left nametags in place so i can move them back if needed 
- general and live config reload

**Fix**
The correct file was located in the window manager at: 

```
.config/bspwm/alacritty/alacritty.toml
```

- added [general] to the top of the file which fixed the errors. it's the same as adding general.import, as the error requested to be fixed.

---

**Archcraft** 

**Polybar**

View Modules

```bash
cat ~/.config/bspwm/themes/default/polybar/modules.ini
```

**Keybindings**

```bash
cat .config/bspwm/sxhkdrc
```

**Missing Music Bar:** re-add songs in ncmpcpp

**Hotkeys:** _Some keys require shift_

**a** - Add selected items to playlist choosing it's location
**Space** - Quick add to playlist  
**1** - Show playlist
**2** - Show browser
**3** - Show search engine
**4** - Show media library
**5** - Show playlist editor
**6** - Show tag editor
**7** - Show outputs
**8** - Show music visualiser
**=** - Show clock
**s** - Stop
**p** - Pause
**Enter** - Play selected item
**Delete** - Delete selected item(s) from playlist
**c** - Clear playlist
**S** - Save playlist
**Left** - Decrease volume by 2%
**Right** + - Increase volume by 2%
**'>'** - Next track
**q** - Quit

---

**Long boot time**

```sh
systemd-analyze blame
```
- The `systemd-analyze blame` command lists all the running units in order of the time each took to initialise, helping to identify potential bottlenecks or problematic services.
- `systemd-analyze`: The primary command to analyze and debug the system’s boot process.
- `blame`: This argument tells the command to list units according to the time they took to start. Units taking a longer time appear at the top.

```sh
systemd-analyze critical-chain
```
- The `critical-chain` option allows administrators to identify and analyse the services that are crucial for other services to start, facilitating targeted optimisations.
- `critical-chain`: This provides a tree view of units whose activation is crucial and blocks others from starting sooner. It helps to map dependencies and understand service start order.

```sh
systemd-analyze security
```
- This command evaluates and reports the security status of running units, helping administrators prioritise security improvements and mitigate potential vulnerabilities.
- `security`: Inspects and reports the security implications of the current `systemd` unit configuration and provides ratings.


Resource: https://commandmasters.com/commands/systemd-analyze-linux/


If you've got an issue related to booting that you wish to investigate, `journalctl` has you covered. Perhaps you've added new hardware, and it isn't responding, or a previously working hardware component no longer works after your last system upgrade.

To see the log entries related to your last boot, use the `-b` (boot) option:
```sh 
journalctl -b
```

To see previous boots, you can use a number to tell `journalctl` which boot you're interested in. To see the third previous boot, use this command:
```sh
journalctl -b 3
```

t is easy to get mixed up with the sequence of boots. To help, we can ask `journalctl` to list the boots that it has recorded in its journal, using the `--list-boots` option:
```sh
journalctl --list-boots
```

Resource: https://www.howtogeek.com/499623/how-to-use-journalctl-to-read-linux-system-logs/

Looking at the output of `journalctl` it looks like the `BIOS` needs to be updated, which makes sense since it hasn't been done since i got the PC. **The Problem fixed itself after a few updates.**

Journalctl Errors: 
amd pstate
- `amd_pstate: min_freq(0) or max_freq(0) or nominal_freq(0) value is incorrect`

nividia
- `nvidia: loading out-of-tree module taints kernel.`
- `nvidia_uvm: module uses symbols nvUvmInterfaceDisableAccessCntr from proprietary module nvidia, inheriting taint`
- `NVRM: loading NVIDIA UNIX x86_64 Kernel Module  570.133.07`
- `nvidia-gpu 0000:29:00.3: i2c timeout error e0000000`

usb
- `usb 1-3: 2:1: cannot get freq at ep 0x2`
- `usb 1-3: 3:1: cannot get freq at ep 0x82`

unpatched
```sh
Unpatched return thunk in use. This should not happen!
WARNING: CPU: 5 PID: 683 at arch/x86/kernel/cpu/bugs.c:3074 __warn_thunk+0x2a/0x40
Modules linked in: amd_atl intel_rapl_msr intel_rapl_common ip6t_REJECT wl(POE+) nf_reject_ipv6 xt_hl ip6t_rt rtl8192ee ipt_REJECT nf_reject_ipv4 btcoexist snd_hda
vboxnetflt(OE) vboxnetadp(OE) vboxdrv(OE) pkcs8_key_parser crypto_user loop dm_mod nfnetlink ip_tables x_tables hid_generic nvme uas nvme_core usbhid usb_storage
CPU: 5 UID: 0 PID: 683 Comm: (udev-worker) Tainted: P           OE      6.14.2-arch1-1 #1 51440b8a0cc8bb91764dac94f6c2b53455e5a907
Tainted: [P]=PROPRIETARY_MODULE, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
Hardware name: Micro-Star International Co., Ltd MS-7B86/B450-A PRO MAX (MS-7B86), BIOS M.50 11/07/2019
```

mDNS
- `WARNING: No NSS support for mDNS detected, consider installing nss-mdns!`
- `WARNING: Detected another IPv4 mDNS stack running on this host. This makes mDNS unreliable and is thus not recommended`

activation request
- `Activation request for 'org.freedesktop.home1' failed: The systemd unit 'dbus-org.freedesktop.home1.service' could not be found`
- `Service file '/usr/share/dbus-1/services/org.knopwob.dunst.service' is not named after the D-Bus name 'org.freedesktop.Notifications'.`
```sh
pacman -Qs pam
```

---

**Pacman**

The command `pacman -Syu` is used for updating your system by refreshing the package database and upgrading installed packages, while `pacman -Syyu` forces a refresh of the package database even if it appears up to date, which can be useful if you suspect database corruption. Generally, you should use `-Syu` for regular updates unless you have specific reasons to force a refresh with `-Syyu`.

---






