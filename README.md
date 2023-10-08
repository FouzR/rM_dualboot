# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

Copy paste the below line into the SSH terminal on the rM in one of the partition, and run it again in the second partition
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/Improved/install.sh && echo "6f716e9e25e312ba1cfb3bdcc87548f7093492c7241aaf9a53a70aa4867f1701  install.sh" | sha256sum -c && sh ./install.sh`


