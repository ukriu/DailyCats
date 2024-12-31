#!/system/bin/sh
PATH=/data/adb/ap/bin:/data/adb/ksu/bin:/data/adb/magisk:$PATH
MODULE_DIR=/data/adb/modules/DailyCats

echo "- meow: downloading new cat..."
echo "- meow: if you're stuck here, check your internet connection!"
sh $MODULE_DIR/download.sh
sleep 2