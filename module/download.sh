#!/system/bin/sh
PATH=/data/adb/ap/bin:/data/adb/ksu/bin:/data/adb/magisk:$PATH
SAVE_DIR="/storage/emulated/0/Pictures/DailyCat"
JSON_PATH="$SAVE_DIR/dailyCat.temp.json"
CAT_PATH="$SAVE_DIR/dailyCat.jpg"
JSON_SOURCE="https://api.thecatapi.com/v1/images/search"
SLEEP="sleep 4"

busybox mkdir -p "$SAVE_DIR"

if busybox wget --no-check-certificate -T 120 -O "$JSON_PATH" "$JSON_SOURCE"; then
    echo "- meow: cat JSON successfully downloaded!"
else
    echo "- meow: successfully failed to download cat JSON!"
    $SLEEP
    exit 1
fi

echo "- meow: extracting image URL from JSON..."
CAT_URL=$(busybox grep -o '"url":"[^"]*"' "$JSON_PATH" | busybox sed -e 's/"url":"//' -e 's/"//')

if [ -z "$CAT_URL" ]; then
    echo "- meow: successfully failed to extract image URL from JSON!"
    $SLEEP
    exit 1
fi

echo "- meow: extracted cat URL:"
echo "- \"$CAT_URL\""

echo "- meow: clearing temporary junk..."
if rm -f "$JSON_PATH"; then
    echo "- meow: successfully removed temporary JSON file!"
else
    echo "- meow: successfully failed to remove temporary JSON file!"
    $SLEEP
    exit 1
fi

echo "- meow: downloading cat..."
if busybox wget --no-check-certificate -T 120 -O "$CAT_PATH" "$CAT_URL"; then
    echo "- meow: cat successfully downloaded!"
else
    echo "- meow: successfully failed to download cat!"
    $SLEEP
    exit 1
fi

echo "- meow: a new cat is currently in your phone :3"
exit 0