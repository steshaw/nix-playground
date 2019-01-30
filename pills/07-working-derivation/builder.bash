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

echo
echo 'Executing ps {'
# Hmmm, cannot run /bin/ps as permission is denied...
/bin/ps || echo ps failed # impure
echo '}'

echo hello >$out
