# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

Copy paste the below line into the SSH terminal on the rM in one of the partition, and run it again in the second partition
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/Improved.png/install.sh && echo "3afa0f79c45223a223c30999b288dbbcd83ca2a7da31250c03dd80cc021cd8ba install.sh" | sha256sum -c && sh ./install.sh`


