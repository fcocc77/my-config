
ip='192.168.100.10'
disk='server'

user='server'
password='vfx'

mount_folder="/mnt/$disk"

if [ ! -d "$mount_folder" ]; then
    mkdir "$mount_folder"
fi

if grep -qs "$mount_folder" /proc/mounts; then
    sudo umount "$mount_folder"
fi

sudo sed -i "/$disk/d" /etc/fstab

sudo sh -c "echo //$ip/$disk /mnt/$disk cifs rw,noperm,username=$user,password=$password 0 0 >> /etc/fstab"

sudo mount -a
