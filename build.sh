#!/bin/sh

export BUILDX_PLATFORMS=linux/amd64
make container

img=localhost/velero/velero:main
gitver="$(git describe --tags)"
dest="harbor.intern.drachenfels.de/user.ruben/velero:$gitver"
buildah push $img "$dest"

echo "$gitver"
echo "$dest"
