#!/bin/sh

set -eux

while true
do
    make "$@" repro
done
