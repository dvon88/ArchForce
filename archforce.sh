#!/bin/bash
    bash 0-preinstall.sh 
    arch-chroot /mnt /root/ArchForce/1-setup.sh  
    source /mnt/root/ArchForce/install.conf
    arch-chroot /mnt /usr/bin/runuser -u $username -- /home/$username/ArchForce/2-user.sh
    arch-chroot /mnt /root/ArchForce/3-post-setup.sh