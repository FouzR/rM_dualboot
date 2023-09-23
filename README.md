# rM_dualboot
A simple service that lets the user to reboot the reMarkable to execute ./switch.sh to change partitions

Copy paste the below line into the SSH terminal on the rM. Theoretically, it should add the bootup service on both partitions 
`wget -O install.sh https://raw.githubusercontent.com/FouzR/rM_dualboot/Improved.png/install.sh && echo "e971c8cecc035a75975de7d45abab9d7cf4de6ef0b1a4155da9537e772cc06d8  install.sh" | sha256sum -c && sh ./install.sh`

