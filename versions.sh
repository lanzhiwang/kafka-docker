#!/bin/bash -e

set -x

MAJOR_VERSION=$(echo "$KAFKA_VERSION" | cut -d. -f1)
export MAJOR_VERSION
# echo 2.6.0
# cut -d. -f1
# MAJOR_VERSION=2
# export MAJOR_VERSION

MINOR_VERSION=$(echo "$KAFKA_VERSION" | cut -d. -f2)
export MINOR_VERSION
# echo 2.6.0
# cut -d. -f2
# MINOR_VERSION=6
# export MINOR_VERSION
