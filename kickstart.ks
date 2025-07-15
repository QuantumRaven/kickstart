# Keyboard layouts
keyboard 'us'
# Root password
rootpw --iscrypted $6$MOYbdjqlJGSVbTsP$tFzCu3QYxh314G/oYApATyfrzIVhmrf.3vl.Hf91JLD83sRAb82VPeCD4zvjlCbEWCTWoK1DYbzAZwQb/Tjde.

# Disk partitioning information
# part /boot --fstype="ext4" --size=512
# part swap --fstype="swap" --size=4096
part /boot --size 512 --asprimary --fstype=ext4 --ondrive=sda
part pv.1 --size 1 --grow --fstype=ext4 --ondrive=sda

# Use network installation
url --url="https://mirror.web-ster.com/rocky/9/BaseOS/x86_64/kickstart"
repo --name=appstream --baseurl=https://mirror.web-ster.com/rocky/9/AppStream/x86_64/os/
# System language
lang en_US
# Firewall configuration
firewall --enabled
# System authorization information
auth  --useshadow  --passalgo=sha512
# Use text install
text
# SELinux configuration
selinux --disabled
# Do not configure the X Window System
skipx
# Reboot after installation
reboot
# System timezone
timezone America/New_York
# System bootloader configuration
bootloader --location=mbr
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel
# Disk partitioning information
part /boot --fstype="ext4" --size=512
part swap --fstype="swap" --size=4096
%include /tmp/password.ks

%pre --interpreter=/bin/bash
wget https://quantumcrow.dev/pre.cfg -O /tmp/pre.cfg
wget https://quantumcrow.dev/packages.cfg -O /tmp/packages.cfg
/bin/bash /tmp/pre.cfg
%end
%packages
%include /tmp/packages.cfg
%end
