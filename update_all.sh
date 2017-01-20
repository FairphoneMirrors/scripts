#!/bin/bash

for dir in */; do
    cd "$dir"
    echo "$dir"
    git fetch -p origin
    git push --mirror github
    cd ..
done
