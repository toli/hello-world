#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

set -x
docker build -f Dockerfile.build -t hello-seattle:build .
docker run --rm hello-seattle:build cat hello > hello
chmod +x hello
./hello > /dev/null
docker build -t hello-seattle:test .
docker run --rm hello-seattle:test
