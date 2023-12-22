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

dl_ver ${1:-1.104.7}
