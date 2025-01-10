#!/system/bin/sh
PATH=/data/adb/ap/bin:/data/adb/ksu/bin:/data/adb/magisk:$PATH
MODULE_DIR=/data/adb/modules/DailyCats

echo "- meow: running download script..."
echo "- meow: if you're stuck here, check your internet connection!"
sh "$MODULE_DIR/download.sh"
if [ -z "$MMRL" ] && { [ "$KSU" = "true" ] || [ "$APATCH" = "true" ]; }; then
    sleep 2
fi
exit 0