# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

Copy paste the below line into the SSH terminal on the rM. Theoretically, it should add the bootup service on both partitions 
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/Improved.png/install.sh && echo "c8a7b789a015d2aedaf9ae05796bdec2d9f0f4c52525cedddc469f8e91d418e6  install.sh" | sha256sum -c && sh ./install.sh`

