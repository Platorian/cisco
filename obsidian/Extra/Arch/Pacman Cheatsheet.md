## Common commands

Install (and update package list)
```sh
pacman -Syu <pkg>
```

Install only
```sh
pacman -S <pkg>
```

Uninstall
```sh
pacman -Rsc <pkg>
```

To uninstall a specific **Arch Linux** package, remove its global configuration, and avoid its orphaned dependencies, use the following command syntax
```sh
sudo pacman -Rns <pkg>
```

Search
```sh
pacman -Ss <keywords>
```

Upgrade everything
```sh
pacman -Syu
```

Update the software database of your **Arch Linux** system
```sh
pacman -Syy
```
## Query 

List installed packages
```sh
pacman -Qn
```

List explicitly-installed packages
```sh
pacman -Qe
```

What files does this package have?
```sh
pacman -Ql <pkg>
```

List information on package
```sh
pacman -Qii <pkg>
```

Who owns this file?
```sh
pacman -Qo <file>
```

Search installed packages for keywords
```sh
pacman -Qs <query>
```

## Orphans

List unneeded packages
```sh
pacman -Qdt
```

Uninstall unneeded packages
```sh
pacman -Rns $(pacman -Qdtq)
```

Avoid orphans by using `pacman -Rsc` to remove packages, which will remove unneeded dependencies.

## Other

What does _pkg_ depend on?
```sh
pactree <pkg>
```

What depends on _pkg_?
```sh
pactree -r <pkg>
```

Resources: https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks

```sh

```


```sh

```