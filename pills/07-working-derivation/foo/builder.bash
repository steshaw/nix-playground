#!/usr/bin/env bash

set -euo pipefail

echo Arguments: "$@"

echo
echo 'Environment: {'
declare -xp
echo '}'

# See if we can find out what version of bash we're using
echo
echo 'Executing set {'
# Looks impure because `BASH=/bin/bash`.
set
echo '}'

# See if we can find out what version of bash we're using
echo
echo 'Explore Nix store {'
find /nix/store -maxdepth 1
echo '}'

echo
echo 'Executing ps {'
# Hmmm, cannot run /bin/ps as permission is denied...
/bin/ps || echo ps failed # impure
echo '}'

# shellcheck disable=SC2154
echo foo >"$out"
