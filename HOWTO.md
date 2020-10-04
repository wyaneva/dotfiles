# HowTo

This is a file with some useful tips on how to do things in ArchLinux (mostly).

### Update clock value

Sometimes my Arch Linux machines show a time that is either a few minutes too slow or too fast. 
When I notice this, I do the following (as advised [here](https://wiki.archlinux.org/index.php/time#Troubleshooting)):

* Setup [ntpd](https://wiki.archlinux.org/index.php/Network_Time_Protocol_daemon) (enabling it as a service is not necessary).
* Run `ntpd -qg` as root. This synchronises the clock with the network.
* Run `hwclock --systohc` as root to write the current software UTC time to the hardware clock.

### Setup wifi 

* #### to automatically connect to networks within range

  A useful blogpost on the topic can be found [here](http://blog.programmableproduction.com/2016/02/15/ArchLinux-Setting-Network-With-Netctl/).

  * Install **wpa_actiond**: `sudo pacman -S wpa_actiond`
  * Enable the service for the network device: `sudo systemctl enable netctl-auto@wlp4s0.service`

* #### to connect to Eduroam

  To connect to Eduroam, we need to manually add a **netctl** profile to `etc/netclt`. 
  An example profile which works for Eduroam in Edinburgh can be found in this repository, in file `wifi/eduroam-profile`.

### Review markdown files

* Install **grip**: `yaourt -S python-grip-git`
* Run: `grip [path-to-file]`
* View in browser at `localhost:6419`

### Sync Thunderbird filters

The file `msgFilterRules.dat` contains the Thunderbird filters for my university account.
It needs to be stored in `$HOME/.thunderbird/[random].default/ImapMail/.sms.ed.ac.uk/`.

### Bind multimedia keys 

* Install the **xbindkeys** package.
* Install [ALSA](https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture).
* Make sure `.xbindkeysrc` is in the $HOME directory.
* To find the name of the key you want to bind, run `xbindkeys -k`.
  (However, this only seems to work if the key is NOT already mapped in `.xbindkeysrc`).
* Run `xbindkeys -p` after every change to `.xbindkeysrc`.
* To execute **xbindkeys** at startup, add the line `xbindkeys &` to `.xinitrc` (already in this repository) OR `.xprofile` (if using a login manager).

### Mount USB/SD card

* Inspect `dmesg` after inserting the usb/card to see which is the device.
* For SD card: `sudo mount -t vfat /dev/mmcblk0p1 /mnt/sdcard`
* For USB: `sudo mount /dev/sdb1 /mnt/usbdisk`
* To unmount: `sudo umount /mnt/sdcard`

### Update archlinux keys

* `sudo rm -r /etc/pacman.d/gnupg`
* `sudo pacman-key --init`
* `sudo pacman-key --populate archlinux`
* `sudo pacman-key --refresh-keys`
* `sudo pacman -Sy gnupg archlinux-keyring`
* `sudo pacman -Sc` - removes old packages from cache
* Then you can upgrade archlinux

### Set screen brightness

* `sudo tee /sys/class/backlight/intel_backlight/brightness <<< 850`
** Use a value between 600 and 850
