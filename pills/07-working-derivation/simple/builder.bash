#!/usr/bin/env bash

set -euo pipefail

declare -xp

# shellcheck disable=SC2154
"$coreutils/bin/mkdir" -p "$out/bin"
# shellcheck disable=SC2154
"$gcc/bin/gcc" -Wall -o "$out/bin/simple" "$simple_source_file"
