#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/replicatedhq/kots/releases/download
APP=kots

dl() {
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}_${arch}"
    local file="${APP}_${platform}.${archive_type}"
    local url=$MIRROR/v$ver/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    # https://github.com/replicatedhq/kots/releases/download/v1.16.0/kots_1.16.0_checksums.txt
    local checksums="${APP}_${ver}_checksums.txt"
    local url=$MIRROR/v$ver/$checksums
    local lchecksums="$DIR/${checksums}"
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  '%s':\n" $ver

    dl $ver $lchecksums darwin all
    dl $ver $lchecksums linux amd64
    dl $ver $lchecksums linux arm64
}

dl_ver 1.105.0
dl_ver 1.105.1
dl_ver 1.105.2
dl_ver 1.105.3
dl_ver 1.105.4
dl_ver 1.105.5
dl_ver 1.106.0
dl_ver 1.107.0
dl_ver 1.107.1
dl_ver 1.107.2
dl_ver 1.107.3
dl_ver 1.107.4
dl_ver 1.107.5
dl_ver 1.107.6
dl_ver 1.107.7
dl_ver 1.107.8
dl_ver 1.108.0
dl_ver 1.108.1
dl_ver 1.108.2
dl_ver 1.108.3
dl_ver 1.108.4
dl_ver 1.108.5
dl_ver 1.108.6
dl_ver 1.108.7
dl_ver 1.108.8
dl_ver 1.108.9
dl_ver 1.108.10
dl_ver 1.108.11
dl_ver 1.108.12
dl_ver 1.108.13
dl_ver 1.109.0
dl_ver 1.109.1
dl_ver 1.109.2
dl_ver 1.109.3
dl_ver 1.109.4
dl_ver 1.109.5
dl_ver 1.109.6
dl_ver 1.109.7
dl_ver 1.109.8
dl_ver 1.109.9
dl_ver 1.109.10
dl_ver 1.109.11
dl_ver 1.109.12
dl_ver 1.109.13
dl_ver 1.109.14
dl_ver 1.110.0
dl_ver 1.111.0
dl_ver 1.112.0
dl_ver 1.112.1
dl_ver 1.112.2
dl_ver 1.112.3
dl_ver 1.112.4
dl_ver 1.113.0
dl_ver 1.114.0
dl_ver 1.115.0
dl_ver 1.115.1
dl_ver 1.115.2
dl_ver 1.116.0
dl_ver 1.116.1
dl_ver 1.117.0
dl_ver 1.117.1
dl_ver 1.117.2
dl_ver 1.117.3
dl_ver 1.117.4
dl_ver 1.117.5
dl_ver 1.118.0
dl_ver 1.119.0
dl_ver 1.119.1
dl_ver 1.120.0
dl_ver 1.120.1
dl_ver 1.120.2
dl_ver 1.120.3
dl_ver 1.121.0
dl_ver 1.121.1
dl_ver 1.121.2
dl_ver 1.122.0
dl_ver 1.122.1
dl_ver 1.123.0
dl_ver 1.123.1
dl_ver 1.124.0
dl_ver 1.124.1
dl_ver 1.124.2
dl_ver 1.124.3
dl_ver 1.124.4
dl_ver ${1:-1.124.5}
