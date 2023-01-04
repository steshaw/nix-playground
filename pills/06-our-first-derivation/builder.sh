#!/bin/bash

# WARNING: Many impurities used such as /usr/bin/* and /bin/*.

echo Arguments: "$@"
echo
echo 'Some Nix variables: {'
echo "  NIX_BUILD_TOP=${NIX_BUILD_TOP}"
echo "  TMP=${TMP}"
echo "  TMPDIR=${TMPDIR}"
echo "  PATH=${PATH}"
echo "  HOME=${HOME}"
echo "  NIX_STORE=${NIX_STORE}"
echo '}'

echo
echo 'Env vars from derivation {'
# shellcheck disable=SC2154
echo "  builder=${builder}"
# shellcheck disable=SC2154
echo "  bust=${bust}"
# shellcheck disable=SC2154
echo "  name=${name}"
# shellcheck disable=SC2154
echo "  out=${out}"
# shellcheck disable=SC2154
echo "  system=${system}"
echo '}'

echo
echo 'Environment: {'
/usr/bin/env | /usr/bin/sort | /usr/bin/sed -e 's/^/  /'
echo '}'

/bin/mkdir -p "${out}/bin"
/bin/cat >"${out}/bin/foo-bar" <<!
#!/bin/sh

echo Hello
!
/bin/chmod +x "${out}/bin/foo-bar"
