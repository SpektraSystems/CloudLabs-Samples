sudo fdisk /dev/sdb <<EOF
p
n
p
1


w
EOF

mkfs.ext4 /dev/sdb1 <<EOF
y
EOF

#"creating Directories to mount "
mkdir -p /mnt/data

#log "Adding partitions to fstab to mount on reboot"
echo "/dev/sdb1     /mnt/data    ext4   defaults,nofail   0 2" >> /etc/fstab

#log "Mounting newly created partition using fstab file"
mount -a
