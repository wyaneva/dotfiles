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
  * Enable the service for the network device: `sudo systemctl enable netclt-auto@wlp4s0.service`

* #### to connect to Eduroam

  To connect to Eduroam, we need to manually add a **netctl** profile to `etc/netclt`. 
  An example profile which works for Eduroam in Edinburgh can be found in this repository, in file `eduroam-profile`.

### Review markdown files

* Install **grip**: `yaourt -S python-grip-git`
* Run: `grip [path-to-file]`
* View in browser at `localhost:6419`
