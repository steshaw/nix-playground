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
set
echo '}'

echo
echo 'Explore Nix store {'
find /nix/store -maxdepth 1
echo '}'

echo
echo 'Explore parent directory {'
ls ..
echo '}'

echo
echo 'Explore / {'
find / -maxdepth 3
echo '}'

echo
echo 'Executing ps {'
# Hmmm, cannot run /bin/ps as permission is denied...
/bin/ps || echo ps failed # impure
echo '}'

# shellcheck disable=SC2154
echo foo >"$out"



echo I was here
