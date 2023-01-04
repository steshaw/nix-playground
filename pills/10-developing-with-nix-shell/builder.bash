#!/usr/bin/env bash

set -euo pipefail
set -x

declare setup name out src

source "$setup"

# Unpack phase.
tar -xf "$src"
cd "${name}"*

# Configure phase.
./configure --prefix="$out"

# Build phase.
make

# Install phase.
make install

# Fixup phase.
find "$out" -type f -exec patchelf --shrink-rpath '{}' \; -exec strip '{}' \;
