#!/usr/bin/env bash

VERSION="$1"
if [ -z "$VERSION" ]; then
    read -p 'What is the version: ' VERSION
fi

APPNAME="appname"

CURRENT_DIR="$(pwd)"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPT_DIR="$(cygpath -m $SCRIPT_DIR)"
mkdir /tmp/$APPNAME
cp -r $SCRIPT_DIR/package/{sciter.dll} /tmp/$APPNAME
cp $SCRIPT_DIR/../../target/release/$APPNAME.exe /tmp/$APPNAME
cd /tmp && zip -r "$CURRENT_DIR/$APPNAME-$VERSION-x86_64-windows.zip" $APPNAME
rm -rf /tmp/$APPNAME
