# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

Copy paste the below line into the SSH terminal on the rM in one of the partition, and run it again in the second partition
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/main/install.sh && echo "6e722caaf951156e91d9eb9e8c2634ae6ae7ea40cca2945c253020e24637620c  install.sh" | sha256sum -c && sh ./install.sh`
