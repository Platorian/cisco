### Update Packages Using Pacman

To update your package list using Pacman, use the **-Sy** flag:

`sudo pacman -Sy`

After synchronising your system's package list with the master servers, you need to upgrade the packages. Use the **-Syu** flag to do the same. This command can take some time depending on the package list and your network connectivity.

`sudo pacman -Syu`

You can save the effort of typing both of these commands by combining them using the **-Syyu** flag. Pacman will start downloading the latest packages automatically after updating the package list.

`sudo pacman -Syyu`

### Update Packages on Arch Linux Using yay

#### YAY

```python
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

To update and upgrade packages using yay, just use the **-Syu** flag:

`sudo yay -Syu`

## Adding Packages on Arch Linux

Adding packages on Arch Linux is easy once you know which commands to execute. All you have to do is type the package manager commands in the terminal.

### Install Packages on Arch Linux With Pacman

Pacman uses the TAR file extension to package applications. It works seamlessly with the Arch Linux system architecture. To add a package using Pacman, use the **-S** flag:

`sudo pacman -S packagename`

For example, to install CMatrix, run:

`sudo pacman -S cmatrix`


![uninstalling packages using pacman](https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/04/uninstalling-packages-using-pacman.jpg)

To install multiple packages at once, type in the package names separated by single spaces:

`sudo pacman -S cmatrix vlc python`

You can also get information about packages after installing them. The output provides details about the name, version, architecture, and license of the package. To do this, replace **-S** with **-Qi** in the default pacman command:

`pacman -Qi cmatrix`

### How to Install Packages With yay

The syntax of yay is pretty similar to that of Pacman. To install a package using the yay package manager, just use the **-S** flag with the default command:

`yay -S packagename`

## Removing Packages in Arch Linux

### Remove Packages With Pacman

Removing a package on Arch Linux is easy as well. All you have to do is use the **-R** flag:

`sudo pacman -R cmatrix`

If the package is not present in your system, you will receive an error stating "**error: target not found: packagename**".

### Remove Packages on Arch Linux With yay

To remove packages using yay, add the **-R** flag to the default yay command. You can also use the **-Rns** flag to remove all unnecessary dependencies from your system.

`yay -R cmatrix   yay -Rns cmatrix   `

If you want to remove the packages your system doesn't need, use the **-Yc** flag:

`yay -Yc`


