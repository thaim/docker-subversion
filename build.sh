#!/bin/sh

VERSION=`cat VERSION`

docker build \
	-t thaim/subversion:${VERSION} \
	.
