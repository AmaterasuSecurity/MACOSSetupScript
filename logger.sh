#!/bin/zshrc
# logger.sh
# Log everything you do in Terminal.

#* Formatted date & time string.
FORMATTED_DATE=`/bin/date "+%Y-%m-%d%H%M%S"`

#* Archive the previous file
/bin/cp -f ~/Desktop/Terminal.log{,.&#36;FORMATTED_DATE.txt}

#* Begin a new one
/usr/bin/script ~/Desktop/zshrc.log
