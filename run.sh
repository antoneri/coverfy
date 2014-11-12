#!/usr/bin/env sh
SCRIPT=$(stat -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
osascript $SCRIPTPATH/coverfy.applescript # > /dev/null 2>&1
