# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

Copy paste the below line into the SSH terminal on the rM in one of the partition, and run it again in the second partition
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/Improved/install.sh && echo "3266bdbe056e26cd12b5aa71bc1e225197d659ca7e7f81f08d77a7f3e427e0a2 install.sh" | sha256sum -c && sh ./install.sh`


