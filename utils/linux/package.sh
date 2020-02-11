#!/usr/bin/env bash

VERSION="$1"
if [ -z "$VERSION" ]; then
    read -p 'What is the version: ' VERSION
fi

APPNAME="appname"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p /tmp/$APPNAME/$APPNAME
cp $SCRIPT_DIR/package/{install.sh,uninstall.sh,$APPNAME.desktop} /tmp/$APPNAME
cp $SCRIPT_DIR/../../target/release/$APPNAME /tmp/$APPNAME/$APPNAME
cp -r $SCRIPT_DIR/package/{libsciter-gtk.so,$APPNAME.png} /tmp/$APPNAME/$APPNAME
tar -czf "$(pwd)/$APPNAME-$VERSION-x86_64-linux.tar.gz" -C /tmp $APPNAME
rm -rf /tmp/$APPNAME
