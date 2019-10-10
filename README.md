# debian-buster-zfs-root
Installs Debian GNU/Linux 10 Buster to a native ZFS root filesystem using a [Debian Live CD](https://www.debian.org/CD/live/). The resulting system is a fully updateable debian system with no quirks or workarounds.
This script installs the ZFS version from the Debian Buster Backports repository.

## Warning

* This script installs swap as a ZFS dataset.
Some users reported deadlocks with zfs version 0.7.9 (see [ZFS Github Issue](https://github.com/zfsonlinux/zfs/issues/7734)).
This script installs version `> 0.8` which might be affected to this bug too.
To disable the creation of a ZFS swap dataset set `SIZESWAP` to `0G`. Make sure to add a seperate swap disk manually if needed.
 
## Usage

1. Boot [Debian Live CD](https://www.debian.org/CD/live/)
1. Login (user: `user`, password: `live`) and become root
1. Setup network and export `http_proxy` environment variable (if needed)
1. Run [this script](https://raw.githubusercontent.com/hn/debian-buster-zfs-root/master/debian-buster-zfs-root.sh)
1. User interface: Select disks and RAID level
1. User interface: Decide if you want Legacy BIOS or EFI boot (only if your hardware supports EFI)
1. Let the installer do the work
1. User interface: install grub to *all* disks participating in the array (only if you're using Legacy BIOS boot)
1. User interface: enter root password and select timezone
1. Reboot
1. Star [this repository](https://github.com/hn/debian-buster-zfs-root) :)

## Customize
It's possible to preseed the script with the appropriate environment variables or modifying this values directly which are defined [here](https://github.com/SoerenBusse/debian-buster-zfs-root/blob/da657044a82cc6d4f2152e82635aa89cd30bbb89/debian-buster-zfs-root.sh#L81).


To execute a custom script after the installation in the chroot of the new installed system you need to set the `POST_INSTALL_SCRIPT` variable to a script location.

## Fixes included

* Some mountpoints, notably `/var`, need to be mounted via fstab as the ZFS mount script runs too late during boot.
* The EFI System Partition (ESP) is a single point of failure on one disk, [this is arguably a mis-design in the UEFI specification](https://wiki.debian.org/UEFI#RAID_for_the_EFI_System_Partition). This script installs an ESP partition to every RAID disk, accompanied with a corresponding EFI boot menu.
* Possibility to use a custom EFI entryname although the [grub efi file uses a hardcoded path to EFI\debian\shimx64.efi](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=925309)

## Bugs

* `grub-install` sometimes mysteriously fails for disk numbers >= 4 (`grub-install: error: cannot find a GRUB drive for /dev/disk/by-id/...`).

## Credits

* https://github.com/hn/debian-stretch-zfs-root
* https://github.com/zfsonlinux/zfs/wiki/Ubuntu-16.04-Root-on-ZFS
* https://janvrany.github.io/2016/10/fun-with-zfs-part-1-installing-debian-jessie-on-zfs-root.html

