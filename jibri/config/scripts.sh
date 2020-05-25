#!/bin/bash
sed -i "s/jibri-nickname/$HOSTNAME/g" /etc/jitsi/jibri/config.json

/usr/bin/Xorg -nocursor -noreset  +extension RANDR +extension RENDER -logfile /tmp/xorg.log  -config /etc/jitsi/jibri/xorg-video-dummy.conf :0 &

/usr/bin/icewm-session &

#/opt/jibri/target/launch.sh
/opt/jibri/resources/debian-package/opt/jitsi/jibri/launch.sh
