# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

Copy paste the below line into the SSH terminal on the rM in one of the partition, and run it again in the second partition
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/Improved/install.sh && echo "afcdaeacbe6d5f76979da9c3e18848d8ce18888c04e88479c86043de0f7c3455  install.sh" | sha256sum -c && sh ./install.sh`


