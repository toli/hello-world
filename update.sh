#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

set -x
docker build -f Dockerfile.build -t hola-mundo:build .
docker run --rm hola-mundo:build cat hello > hello
chmod +x hello
