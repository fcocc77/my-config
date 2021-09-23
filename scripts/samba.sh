#!/bin/sh
#----------------------
user=pancho
shared="/home/pancho/Documents"
#----------------------

name=$(basename $shared)

sudo dnf -y install samba samba-client samba-common
sudo smbpasswd -a $user

echo "[global]
workgroup = WORKGROUP
server string = Samba Server %v
security = user
map to guest = bad user
dns proxy = no

[$name]
path = $shared
browsable =yes
writable = yes
guest ok = no
read only = no
create mask = 0777
directory mask = 0777" > /etc/samba/smb.conf

sudo chcon -Rt samba_share_t $shared

sudo systemctl start smb
sudo systemctl start nmb
sudo systemctl enable smb
sudo systemctl enable nmb

sudo firewall-cmd --zone=public --permanent --add-port 139/tcp
sudo firewall-cmd --zone=public --permanent --add-port 445/tcp

sudo firewall-cmd --zone=public --permanent --add-port 137/udp
sudo firewall-cmd --zone=public --permanent --add-port 138/udp


