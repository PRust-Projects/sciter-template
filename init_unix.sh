#!/usr/bin/env bash

read -p 'What is the application name: ' APPNAME
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

perl -pi -e s,APPNAME=\"appname\",APPNAME=\"$APPNAME\",g $SCRIPT_DIR/utils/darwin/build.sh
perl -pi -e s,APPNAME=\"appname\",APPNAME=\"$APPNAME\",g $SCRIPT_DIR/utils/darwin/package.sh
perl -pi -e s,APPNAME=\"appname\",APPNAME=\"$APPNAME\",g $SCRIPT_DIR/utils/linux/build.sh
perl -pi -e s,APPNAME=\"appname\",APPNAME=\"$APPNAME\",g $SCRIPT_DIR/utils/linux/package.sh
perl -pi -e s,APPNAME=\"appname\",APPNAME=\"$APPNAME\",g $SCRIPT_DIR/utils/linux/package/install.sh
perl -pi -e s,APPNAME=\"appname\",APPNAME=\"$APPNAME\",g $SCRIPT_DIR/utils/linux/package/uninstall.sh
perl -pi -e s,APPNAME=\"appname\",APPNAME=\"$APPNAME\",g $SCRIPT_DIR/utils/windows/build.sh
perl -pi -e s,APPNAME=\"appname\",APPNAME=\"$APPNAME\",g $SCRIPT_DIR/utils/windows/package.sh

perl -pi -e x,appname,$APPNAME,g $SCRIPT_DIR/utils/darwin/package/Info.plist
