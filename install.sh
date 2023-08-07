wget -O switch.sh -nc https://raw.githubusercontent.com/ddvk/remarkable-update/main/switch.sh
wget -O switch_service.service https://raw.githubusercontent.com/FouzR/rM_dualboot/main/switch_service.service
declare -A checksums=(
["./switch.sh"]="c6b165745d67cb7adc62d7826253ad027a55ee2551d189c37f7d3181e7358044"
["./switch_service.service"]="68511f046e4d5ea4fd97314e7c7451279aeae232d3ea338f0d275cc48175253d"
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
cp switch_service.service /etc/systemd/system/
chmod 644 /etc/systemd/system/switch_service.service
systemctl daemon-reload
systemctl enable --now switch_service.service
rm switch_service.service
