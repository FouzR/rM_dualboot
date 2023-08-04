wget -O switch.sh -nc https://raw.githubusercontent.com/ddvk/remarkable-update/main/switch.sh
chmod +x ./switch.sh
wget -O switch_service.service https://raw.githubusercontent.com/FouzR/rM_dualboot/main/switch_service.service
cp switch_service.service /etc/systemd/system/
chmod 644 /etc/systemd/system/switch_service.service
systemctl daemon-reload
systemctl enable --now switch_service.service
