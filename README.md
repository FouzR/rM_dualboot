# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

Copy paste the below line into the SSH terminal on the rM in one of the partition, and run it again in the second partition
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/main/install.sh && echo "d5d7461daf04a09df2f5d5545ff946cb7f0479caa2587418891c38942536ca0a  install.sh" | sha256sum -c && sh ./install.sh`
