adb shell '
sendevent /dev/input/event4 3 57 0
sendevent /dev/input/event4 3 53 1000
sendevent /dev/input/event4 3 54 1000
sendevent /dev/input/event4 3 48 5
sendevent /dev/input/event4 3 58 50
sendevent /dev/input/event4 0 2 0
sendevent /dev/input/event4 0 0 0
busybox usleep 50000
sendevent /dev/input/event4 3 57 -1
sendevent /dev/input/event4 0 2 0
sendevent /dev/input/event4 0 0 0'
