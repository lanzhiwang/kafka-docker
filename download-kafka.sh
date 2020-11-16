#!/bin/sh -e

set -x

# shellcheck disable=SC1091
source "/usr/bin/versions.sh"
# source /usr/bin/versions.sh

FILENAME="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"
# FILENAME=kafka_2.13-2.6.0.tgz

url=$(curl --stderr /dev/null "https://www.apache.org/dyn/closer.cgi?path=/kafka/${KAFKA_VERSION}/${FILENAME}&as_json=1" | jq -r '"\(.preferred)\(.path_info)"')
# curl --stderr /dev/null 'https://www.apache.org/dyn/closer.cgi?path=/kafka/2.6.0/kafka_2.13-2.6.0.tgz&as_json=1'
# jq -r '"\(.preferred)\(.path_info)"'
# url=https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.6.0/kafka_2.13-2.6.0.tgz

# Test to see if the suggested mirror has this version, currently pre 2.1.1 versions
# do not appear to be actively mirrored. This may also be useful if closer.cgi is down.
if [[ ! $(curl -s -f -I "${url}") ]]; then
    echo "Mirror does not have desired version, downloading direct from Apache"
    url="https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/${FILENAME}"
fi

echo "Downloading Kafka from $url"
# echo 'Downloading Kafka from https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.6.0/kafka_2.13-2.6.0.tgz'

wget "${url}" -O "/tmp/${FILENAME}"
# wget https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.6.0/kafka_2.13-2.6.0.tgz -O /tmp/kafka_2.13-2.6.0.tgz
