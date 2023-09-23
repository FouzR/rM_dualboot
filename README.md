# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

Copy paste the below line into the SSH terminal on the rM. Theoretically, it should add the bootup service on both partitions 
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/Improved.png/install.sh && echo "3161b7f8eb3a8deb3483c815590e84ddc8ff559963ef59c5d379224875f127c9  install.sh" | sha256sum -c && sh ./install.sh`

