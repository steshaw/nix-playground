#!/usr/bin/env bash

set -euo pipefail

declare -xp
# shellcheck disable=SC2154
export PATH="$coreutils/bin:$gcc/bin${PATH:+:${PATH}}"
# shellcheck disable=SC2154
mkdir -p "$out/bin"
# shellcheck disable=SC2154
gcc -Wall -o "$out/bin/simple" "$simple_source_file"
