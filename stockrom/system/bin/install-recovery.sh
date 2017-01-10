#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8908800 04702a63718b201219bcb076ced3d4b9a799daeb 5173248 474d50377a2e7b98799c1190771922c38bb77bfb
fi

if ! applypatch -c EMMC:/dev/block/mmcblk0p17:8908800:04702a63718b201219bcb076ced3d4b9a799daeb; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/mmcblk0p9:5173248:474d50377a2e7b98799c1190771922c38bb77bfb EMMC:/dev/block/mmcblk0p17 04702a63718b201219bcb076ced3d4b9a799daeb 8908800 474d50377a2e7b98799c1190771922c38bb77bfb:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
