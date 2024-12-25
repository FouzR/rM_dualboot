#/bin/bash
OLDPART=$(< /sys/devices/platform/lpgpr/root_part)
if [[ $OLDPART  ==  "a" ]]; then
	    NEWPART="b"
    else
	        NEWPART="a"
fi
echo $NEWPART > /sys/devices/platform/lpgpr/root_part
