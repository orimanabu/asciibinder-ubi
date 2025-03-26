#!/bin/bash

if [ x"$#" != x"1" ]; then
	echo "$0 subcmd"
	exit 1
fi
subcmd=$1; shift

case ${subcmd} in
singlearch-build)
	podman build -t quay.io/manabu.ori/asciibinder .
	#podman push quay.io/manabu.ori/asciibinder
	;;
build|multiarch-build)
	podman manifest create quay.io/manabu.ori/asciibinder
	podman build --platform linux/amd64,linux/arm64  --manifest quay.io/manabu.ori/asciibinder .
	#podman manifest push quay.io/manabu.ori/asciibinder
	;;
run)
	podman run --rm -it -v `pwd`:/docs:Z quay.io/manabu.ori/asciibinder asciibinder build
	;;
esac
