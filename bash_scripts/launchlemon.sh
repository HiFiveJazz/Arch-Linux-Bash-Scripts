#!/bin/bash
# Launches an instance of lemonbar
killall -q lemonbar
killall -q lemonconfig
lemonconfig | lemonbar -p -g 1920x32+0+0 -F "#FFFFFFFF" -B "#FF2222222" -U "#268bd2" -u 3 -o -4 -f "JetBrains Mono Light"-10
