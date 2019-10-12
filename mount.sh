#!/bin/bash
mount -t zfs vpool/ROOT/debian-sid /mnt/
zfs list | grep ^vpool | awk ' ~ legacy {print }' | sed '1d;2d;3d' | sed 's/vpool\///g' | xargs -I{} echo mount -t zfs vpool/{} /mnt/{}
