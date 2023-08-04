mkdir -p /home/root/bin
cd /home/root/bin
wget -O Test.zip https://github.com/FouzR/rM_dualboot/archive/refs/tags/Test.zip
unzip -o Test.zip
cp switch_service.service /etc/systemd/system/
chmod 644 /etc/systemd/system/switch_service.service
systemctl daemon-reload
systemctl enable --now switch_service.service
