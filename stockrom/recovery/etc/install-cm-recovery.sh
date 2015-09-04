#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11046912 b13e90aeaad926c88e4e3f3006932871ed5aad0c 6279168 0cd055a189fb8392b5e7a1b97614bec0af432756
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:11046912:b13e90aeaad926c88e4e3f3006932871ed5aad0c; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6279168:0cd055a189fb8392b5e7a1b97614bec0af432756 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery b13e90aeaad926c88e4e3f3006932871ed5aad0c 11046912 0cd055a189fb8392b5e7a1b97614bec0af432756:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
