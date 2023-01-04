#!/usr/bin/env bash

set -euo pipefail

declare deps out src

declare -xp

unset PATH
for p in $deps; do
  export PATH="$p/bin${PATH:+:${PATH}}"
done

echo 'PATH = {'
echo "$PATH" | tr ':' '\n' | sed -e 's/^/  /'
echo '}'

tar --strip-components=1 -xf "$src"

./configure --prefix="$out"
make
make install
