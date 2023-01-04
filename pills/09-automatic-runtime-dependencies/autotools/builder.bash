#!/usr/bin/env bash

set -euo pipefail
set -x

declare baseInputs buildInputs name out src

declare -xp

unset PATH
for p in $baseInputs $buildInputs; do
  export PATH=$p/bin${PATH:+:${PATH}}
done

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
