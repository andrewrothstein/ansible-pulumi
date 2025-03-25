#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://get.pulumi.com/releases/sdk

dl()
{
    local lchecksums=$1
    local ver=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="$os-$arch"
    local file=pulumi-v$ver-$platform.$archive_type
    local url=$MIRROR/$file

    printf "    # %s\n" $url
    printf "    %s: sha512:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dlver () {
    local ver=$1

    local rchecksums="https://github.com/pulumi/pulumi/releases/download/v${ver}/SHA512SUMS"
    local lchecksums="${DIR}/pulumi_checksums_${ver}"
    if [ ! -e "${lchecksums}" ];
    then
        curl -sSLf -o "${lchecksums}" "${rchecksums}"
    fi

    printf "  # %s\n" $rchecksums
    printf "  v%s:\n" $ver
    dl $lchecksums $ver linux arm64
    dl $lchecksums $ver linux x64
    dl $lchecksums $ver darwin arm64
    dl $lchecksums $ver darwin x64
    dl $lchecksums $ver windows x64 zip
    dl $lchecksums $ver windows arm64 zip
}

dlver ${1:-3.158.0}
