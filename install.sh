mkdir /tmp/rM_dualboot
wget -O switch.sh -nc https://raw.githubusercontent.com/ddvk/remarkable-update/main/switch.sh
wget -O /tmp/rM_dualboot/switch_service.service https://raw.githubusercontent.com/FouzR/rM_dualboot/main/switch_service.service
declare -A checksums=(
["./switch.sh"]="c6b165745d67cb7adc62d7826253ad027a55ee2551d189c37f7d3181e7358044"
["/tmp/rM_dualboot/switch_service.service"]="8ac9b202330e4a57d8b2b7a0cdb938f29fed118be395732f960693ee81ab027e"
)

# find device model
Model=$(< /sys/devices/soc0/machine)
rM2="reMarkable 2.0"
if [[ "$Model" == "$rM2" ]]; then
    dsk="2"
else
    dsk="1"
fi

for check in ${!checksums[@]}
do
    echo "${checksums[$check]}  $check" | sha256sum -c
    if [ $? != 0 ]; then
        echo 'Error: Checksum failed. Halting install'
        exit 1
    else
        echo "Checksum succeeded: Proceeding"
    fi
done
chmod +x ./switch.sh
chmod 644 /tmp/rM_dualboot/switch_service.service
cp /tmp/rM_dualboot/switch_service.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable --now switch_service.service
# The below code aims to do the same but for the other partition

# check active partition using print_env or whatever

OLDPART=$(fw_printenv -n active_partition)
if [ $OLDPART  ==  "2" ]; then
    NEWPART="3"
else
    NEWPART="2"
fi
mkdir /mnt/old_part


mount /dev/mmcblk${dsk}p${OLDPART} /mnt/old_part
cp /tmp/rM_dualboot/switch_service.service /mnt/old_part/etc/systemd/system/
ln -s /mnt/old_part/systemd/system/switch_service.service /mnt/old_part/etc/systemd/system/multi-user.target.wants/switch_service.service
umount /mnt/old_part
rm -r /mnt/old_part

