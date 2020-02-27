#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
"$SCRIPT_DIR/build/packfolder" "$SCRIPT_DIR/../../src/resources" "$SCRIPT_DIR/../../src/resources.rc" -binary
cargo build --release
