set -e

if ! command chronic &> /dev/null;then
    function chronic(){
        tmp=$(mktemp) || return
        "$@" > "$tmp" 2>&1
        ret=$?
        [ "$ret" -eq 0 ] || cat "$tmp"
        rm -f "$tmp"
        return "$ret"
    }
fi
echo "Creating /tmp/rM_dualboot"
mkdir /tmp/rM_dualboot || true
echo "Retrieving files......"
chronic wget -O switch.sh -r https://raw.githubusercontent.com/ddvk/remarkable-update/main/switch.sh
chronic wget -O /tmp/rM_dualboot/switch_service.service https://raw.githubusercontent.com/FouzR/rM_dualboot/main/switch_service.service
echo "Retrieved switch.sh and the service files"
declare -A checksums=(
["./switch.sh"]="c6b165745d67cb7adc62d7826253ad027a55ee2551d189c37f7d3181e7358044"
["/tmp/rM_dualboot/switch_service.service"]="8ac9b202330e4a57d8b2b7a0cdb938f29fed118be395732f960693ee81ab027e"
)
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

# find device model
Model=$(< /sys/devices/soc0/machine)
rM2="reMarkable 2.0"
if [[ "$Model" == "$rM2" ]]; then
    dsk="2"
    echo "Detected rM 2"
else
    dsk="1"
    echo "Detected rM 1"
fi

chmod 644 /tmp/rM_dualboot/switch_service.service

echo "Copying service file....."
cp /tmp/rM_dualboot/switch_service.service /etc/systemd/system/

# check active partition using print_env or whatever

OLDPART=$(fw_printenv -n active_partition)
if [ $OLDPART  ==  "2" ]; then
    NEWPART="3"
else
    NEWPART="2"
fi

echo "Creating /mnt/old_part"
mkdir /mnt/old_part || true

#running the partition check _before_ the systemctl runs, as that alters
# the active_partiton, annoyingly

systemctl daemon-reload
chronic systemctl enable --now switch_service.service
echo "Successfully enabled the service"
# The below code aims to do the same but for the other partition

echo "Now installing to secondary partition"

echo "Mounting /dev/mmcblk${dsk}p${NEWPART} to /mnt/old_part"
mount /dev/mmcblk${dsk}p${NEWPART} /mnt/old_part

echo "Copying service file to fallback"
cp /tmp/rM_dualboot/switch_service.service /mnt/old_part/etc/systemd/system/
echo "Linking the service file...."
ln -s /etc/systemd/system/switch_service.service /mnt/old_part/etc/systemd/system/multi-user.target.wants/switch_service.service

fallback=$(cat /usr/share/remarkable/update.conf | grep "REMARKABLE_RELEASE_VERSION")
current=$(cat /mnt/old_part/usr/share/remarkable/update.conf | grep "REMARKABLE_RELEASE_VERSION")

fallbackV=${fallback##=}
currentV=${current##=}
echo "Finished installing... Unmounting the partition and cleaning up...."
umount /mnt/old_part
rmdir /mnt/old_part

echo "Current version = ${currentV}"
echo "Fallback version = ${fallbackV}"
echo "Dual Booting enabled between the above two versions"
echo "Remember to disable auto updates""
