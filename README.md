# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

Copy paste the below line into the SSH terminal on the rM in one of the partition, and run it again in the second partition
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/WithSuspended.png/install.sh && echo "7dc6a534ca5a6c664ec9e2cba441f8eb8b153e6a893b6a7ea469b3d8396466db install.sh" | sha256sum -c && sh ./install.sh`


