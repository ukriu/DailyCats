#!/system/bin/sh
PATH=/data/adb/ap/bin:/data/adb/ksu/bin:/data/adb/magisk:$PATH
SAVE_DIR="/storage/emulated/0/Pictures/DailyCat"
SAVE_PATH="$SAVE_DIR/dailyCat.jpg"

busybox mkdir -p "$SAVE_DIR"
if busybox wget --no-check-certificate -T 120 -O "$SAVE_PATH" https://cataas.com/cat/cute; then
    echo "- meow: cat successfully downloaded!"
else
    echo "- meow: successfully failed to download image!"
fi