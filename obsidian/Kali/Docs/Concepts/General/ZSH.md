- In order for **Oh My Zsh** to work, **Zsh must be installed**.
    - Please run `zsh --version` to confirm.
    - Expected result: `zsh 5.0.8` or more recent
- Additionally, Zsh should be set as your default shell.
    - Please run `echo $SHELL` from a new terminal to confirm.
    - Expected result: `/usr/bin/zsh` or similar

`sudo apt install zsh`

- Verify installation by running `zsh --version`. Expected result: `zsh 5.0.8` or more recent.
    
- Make it your default shell: `chsh -s $(which zsh)` or use `sudo lchsh $USER` if you are on Fedora
		- Note that this will not work if Zsh is not in your authorized shells list (`/etc/shells`) or if you don't have permission to use `chsh`. If that's the case [you'll need to use a different procedure](https://www.google.com/search?q=zsh+default+without+chsh).
- If you use `lchsh` you need to type `/bin/zsh` to make it your default shell.
### Arch Linux or Manjaro
`pacman -S zsh`


### Prompt
### Quick Install

- Install the **starship** binary:
    
    #### Install Latest Version
    

With Shell:

sh

```
curl -sS https://starship.rs/install.sh | sh
```

To update the Starship itself, rerun the above script.
Try looking in your OS package manger.

---
Currently using:
https://github.com/ohmyzsh/ohmyzsh

### Prerequisites

- [Zsh](https://www.zsh.org) should be installed (v4.3.9 or more recent is fine but we prefer 5.0.8 and newer). If not pre-installed (run `zsh --version` to confirm), check the following wiki instructions here: [Installing ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- `curl` or `wget` should be installed
- `git` should be installed (recommended v2.4.11 or higher)

#### Manual Inspection

It's a good idea to inspect the install script from projects you don't yet know. You can do that by downloading the install script first, looking through it so everything looks normal, then running it:

```shell
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
```

#### Enabling Plugins

Once you spot a plugin (or several) that you'd like to use with Oh My Zsh, you'll need to enable them in the `.zshrc` file. You'll find the zshrc file in your `$HOME` directory. Open it with your favorite text editor and you'll see a spot to list all the plugins you want to load.

```shell
vi ~/.zshrc
```

#### Selecting A Theme

_Robby's theme is the default one. It's not the fanciest one. It's not the simplest one. It's just the right one (for him)._

Once you find a theme that you'd like to use, you will need to edit the `~/.zshrc` file. You'll see an environment variable (all caps) in there that looks like:

```shell
ZSH_THEME="robbyrussell"
```

##### Change Your Default Shell

```shell
chsh -s $(which zsh)
```

Preferred window manager:
- Terminator 

Plugins
- https://github.com/stevemcilwain/quiver

