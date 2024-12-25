# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

## NOTE: Currently only works on the rM1 and rM2. A Paper Pro version is in the works. For now, you can use the SwitchPro.sh script to swap the partitions 
Copy paste the below line into the SSH terminal on the rM in one of the partition, and it will copy over the service on both partitions
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/main/install.sh && echo "6e722caaf951156e91d9eb9e8c2634ae6ae7ea40cca2945c253020e24637620c  install.sh" | sha256sum -c && sh ./install.sh`
