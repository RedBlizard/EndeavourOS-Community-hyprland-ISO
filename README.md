# EndeavourOS-ISO (Community Edition)

[![Maintenance](https://img.shields.io/maintenance/yes/2024.svg)]()


This ISO is based on hugely modified Arch-ISO to provide Installation Environment for EndeavourOS.  
More info at [EndeavourOS-GitHub-Development](https://endeavouros-team.github.io/EndeavourOS-Development/)




### Development source

- [EndeavourOS-ISO source](https://github.com/endeavouros-team/EndeavourOS-ISO) (Live environment with KDE-Desktop)
- [Calamares {EndeavourOS fork}](https://github.com/endeavouros-team/calamares) (installer framework)


### Base source

- [Arch-ISO](https://gitlab.archlinux.org/archlinux/archiso)
- [Calamares](https://github.com/calamares/calamares)



# Boot options

Systemd-boot for UEFI systems:  
<img src="https://raw.githubusercontent.com/endeavouros-team/screenshots/master/Apollo/apollo-systemdboot.png" alt="drawing" width="600"/>

Bios-boot (syslinux) for legacy systems:  
<img src="https://raw.githubusercontent.com/endeavouros-team/screenshots/master/Apollo/apollo-syslinux.png" alt="drawing" width="600"/>



# How to build ISO

You need to use an installed EndeavourOS system or any archbased system with EndeavourOS [repository](https://github.com/endeavouros-team/mirrors) enabled.

As the installer packages and needed dependencies will get installed from EndeavourOS repository.


### Install build dependencies

```
sudo pacman -S archiso git squashfs-tools --needed
```
It is recommended to reboot after these changes.

### Build

##### 1. Prepare

```
git clone https://github.com/endeavouros-team/EndeavourOS-ISO.git
cd EndeavourOS-ISO
./prepare.sh
```

And put the resulting package into ISO structure to get installed with the ISO build procedure:

`airootfs/root/packages/`

To get this working you need to remove `calamares` from `packages.x86_64` before starting ISO build.

##### 2. Build

~~~
sudo ./mkarchiso -v "."
~~~

**or with log:**

~~~
sudo ./mkarchiso -v "." 2>&1 | tee "eosiso_$(date -u +'%Y.%m.%d-%H:%M').log"
~~~

##### 3. The .iso file appears in the `out` directory...


## Advanced

To install locally built packages on ISO, put the packages inside the following directory:

~~~
airootfs/root/packages
~~~

Packages will be installed and the directory will be cleaned up after that.
