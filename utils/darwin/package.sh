#!/usr/bin/env bash

VERSION="$1"
if [ -z "$VERSION" ]; then
    read -p 'What is the version: ' VERSION
fi

APPNAME="appname"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p /tmp/$APPNAME.app/Contents/{MacOS,Resources}
cp $SCRIPT_DIR/package/Info.plist /tmp/$APPNAME.app/Contents
cp $SCRIPT_DIR/../../target/x86_64-apple-darwin/release/$APPNAME /tmp/$APPNAME.app/Contents/MacOS
cp -r $SCRIPT_DIR/package/sciter-osx-64.dylib /tmp/$APPNAME.app/Contents/MacOS
cp $SCRIPT_DIR/package/$APPNAME.icns /tmp/$APPNAME.app/Contents/Resources
tar -czf "$(pwd)/$APPNAME-$VERSION-x86_64-darwin.tar.gz" -C /tmp $APPNAME.app
rm -rf /tmp/$APPNAME.app
