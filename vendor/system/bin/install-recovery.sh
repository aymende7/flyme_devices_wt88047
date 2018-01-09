#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11409408 dba977a1ef67a9ef2a3f35d926cc3d17503aa2e2 8888320 b18d37b1e2ae210f1a9c831be2c689469fba60f0
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:11409408:dba977a1ef67a9ef2a3f35d926cc3d17503aa2e2; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:8888320:b18d37b1e2ae210f1a9c831be2c689469fba60f0 EMMC:/dev/block/bootdevice/by-name/recovery dba977a1ef67a9ef2a3f35d926cc3d17503aa2e2 11409408 b18d37b1e2ae210f1a9c831be2c689469fba60f0:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
