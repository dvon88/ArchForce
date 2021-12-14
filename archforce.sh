#!/bin/bash
    echo 'PREINSTALL IN 3...' && sleep 1
    echo 'PREINSTALL IN 2...' && sleep 1
    echo 'PREINSTALL IN 1...' && sleep 1
    bash 0-preinstall.sh 

    echo 'SETUP IN 3...' && sleep 1
    echo 'SETUP IN 2...' && sleep 1
    echo 'SETUP IN 1...' && sleep 1
    arch-chroot /mnt /root/ArchForce/1-setup.sh  
    source /mnt/root/ArchForce/install.conf
    arch-chroot /mnt /usr/bin/runuser -u $username -- /home/$username/ArchForce/2-user.sh
    arch-chroot /mnt /root/ArchForce/3-post-setup.sh