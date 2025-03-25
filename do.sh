#!/bin/bash

podman build -t quay.io/manabu.ori/asciibinder .
#podman push quay.io/manabu.ori/asciibinder
#podman run --rm -it -v `pwd`:/docs:Z quay.io/manabu.ori/asciibinder asciibinder build
