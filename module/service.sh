#!/system/bin/sh
PATH=/data/adb/ap/bin:/data/adb/ksu/bin:/data/adb/magisk:$PATH
MODULE_DIR=/data/adb/modules/DailyCats
CRON_DIR=$MODULE_DIR/cron

echo "meow: running service.sh"
mkdir -p $CRON_DIR

echo "0 0 * * * su 'sh $MODULE_DIR/download.sh'" | busybox crontab -c $CRON_DIR -
busybox crond -c $CRON_DIR

until [ "$(getprop sys.boot_completed)" == "1" ]; do
    sleep 60
done

sh $MODULE_DIR/download.sh