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




