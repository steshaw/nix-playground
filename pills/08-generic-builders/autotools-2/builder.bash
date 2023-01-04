#!/usr/bin/env bash

set -euo pipefail

declare baseInputs buildInputs name out src

declare -xp

unset PATH
for p in $baseInputs $buildInputs; do
  export PATH=$p/bin${PATH:+:${PATH}}
done

tar -xf "$src"

cd "${name}"*

./configure --prefix="$out"
make
make install
