#!/bin/bash

for D in *; do
    if [ -d "${D}" ]; then
        cd "${D}"
        echo "${D}"
        git fetch -p origin
        git push --mirror github
        cd ..
    fi
done
