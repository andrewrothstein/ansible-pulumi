#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://get.pulumi.com/releases/sdk

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local archive_type=${4:-tar.gz}
    local platform="$os-$arch"
    local file=pulumi-v$ver-$platform.$archive_type
    local url=$MIRROR/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dlver () {
    local ver=$1
    printf "  v%s:\n" $ver
    dl $ver linux arm64
    dl $ver linux x64
    dl $ver darwin arm64
    dl $ver darwin x64
    dl $ver windows x64 zip
    dl $ver windows arm64 zip
}

dlver ${1:-3.43.1}
