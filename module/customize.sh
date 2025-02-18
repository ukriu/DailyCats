if ! $BOOTMODE; then
    ui_print "*********************************************************"
    ui_print "Installing from recovery is not supported!"
    ui_print "Please install from the Magisk / KernelSU / APatch app!"
    abort    "*********************************************************"
fi

echo "- meow: daily cat image path = \"/sdcard/Pictures/DailyCat/\""
echo "- meow: the cat image will be replaced upon every reboot, at midnight and when using the action button :3"