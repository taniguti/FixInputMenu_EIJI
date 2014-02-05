#!/bin/sh
# taniguchi.takanori@dena.jp

HIRAGANA=com.apple.inputmethod.Japanese
EIJI=com.apple.inputmethod.Roman
PLIST="/Library/Preferences/com.apple.HIToolbox.plist"

if [ ! -f "$PLIST" ]; then echo "$PLIST not found. Nothing changed."; exit 0 ;fi
if [ `whoami` != 'root' ]; then echo "Use sudo!"; exit 0 ; fi

CURRENT_MODE=`/usr/libexec/PlistBuddy -c "print AppleInputSourceHistory:0:Input\ Mode" "$PLIST"`

if [ ${CURRENT_MODE} = ${HIRAGANA} ]; then
	/usr/libexec/PlistBuddy -c "set AppleInputSourceHistory:0:Input\ Mode ${EIJI}" "$PLIST"
fi
