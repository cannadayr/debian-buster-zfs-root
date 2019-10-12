#!/bin/bash
DISK=mydisk

mount -t zfs vpool/ROOT/debian-sid /mnt/
mount /dev/disk/by-id/$DISK-part2 /boot/
zfs list | grep ^vpool | awk ' ~ legacy {print }' | sed '1d;2d;3d' | sed 's/vpool\///g' | xargs -I{} echo mount -t zfs vpool/{} /mnt/{}

mount --rbind /dev /mnt/dev
mount --rbind /proc /mnt/proc
mount --rbind /sys /mnt/sys
