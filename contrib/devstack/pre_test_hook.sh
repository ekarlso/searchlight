#!/bin/bash

set -ex

# Install searchlight devstack integration
pushd $BASE/new/searchlight/contrib/devstack

for f in lib/* extras.d/* exercises/*; do
    if [ ! -e "$BASE/new/devstack/$f" ]; then
        echo "Installing: $f"
        cp -r $f $BASE/new/devstack/$f
    fi
done

popd
