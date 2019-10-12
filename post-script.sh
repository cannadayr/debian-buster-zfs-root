#/bin/bash

# everybody
chroot /target /usr/bin/apt-get install --yes haveged # cryptsetup
# diagnostics & dev
chroot /target /usr/bin/apt-get install --yes git tmux vim-nox subversion
# laptop stuff
chroot /target /usr/bin/apt-get install --yes firmware-iwlwifi wpasupplicant iw keyutils gnome-core firefox
# zfs build dependencies
chroot /target /usr/bin/apt install build-essential autoconf automake libtool gawk alien fakeroot ksh \
            zlib1g-dev uuid-dev libattr1-dev libblkid-dev libselinux-dev libudev-dev \
            libacl1-dev libaio-dev libdevmapper-dev libssl-dev libelf-dev \
            python3 python3-dev python3-setuptools python3-cffi
# autosys stuff
chroot /target /usr/bin/apt-get install --yes sqlite3 dmidecode

chroot /target /usr/bin/git clone https://github.com/cannadayr/autosys.git /var/opt/autosys
