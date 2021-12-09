#!/bin/bash

    echo "Preinstall in 3 Seconds ..." && sleep 1
    echo "Preinstall in 2 Seconds ..." && sleep 1
    echo "Preinstall in 1 Second ..." && sleep 1    
    bash 0-preinstall.sh

    echo "Setup in 3 Seconds ..." && sleep 1
    echo "Setup in 2 Seconds ..." && sleep 1
    echo "Setup in 1 Second ..." && sleep 1    
    arch-chroot /mnt /root/ArchForce/1-setup.sh

    echo "Install conf in 3 Seconds ..." && sleep 1
    echo "Install conf in 2 Seconds ..." && sleep 1
    echo "Install conf in 1 Second ..." && sleep 1    
    source /mnt/root/ArchForce/install.conf

    echo "Mount in 3 Seconds ..." && sleep 1
    echo "Mount in 2 Seconds ..." && sleep 1
    echo "Mount in 1 Second ..." && sleep 1    
    arch-chroot /mnt /usr/bin/runuser -u $username -- /home/$username/ArchForce/2-user.sh

    echo "Post setup in 3 Seconds ..." && sleep 1
    echo "Post setup in 2 Seconds ..." && sleep 1
    echo "Post setup in 1 Second ..." && sleep 1    
    arch-chroot /mnt /root/ArchForce/3-post-setup.sh