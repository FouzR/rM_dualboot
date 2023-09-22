# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions
### This branch includes a suspended.png file for personal use. I added it to make things easy for me when I upgrade to a new version and want the old suspended image
Copy paste the below line into the SSH terminal on the rM in one of the partition, and run it again in the second partition
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/WithSuspended.png/install.sh && echo "d80009c8d3bd0a993e7537eb55e4c5d5e73feb93f6e79a4d8af9084f1307fda7 install.sh" | sha256sum -c && chmod +x ./install.sh && ./install.sh`

