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
echo "  builder=${builder}"
echo "  bust=${bust}"
echo "  name=${name}"
echo "  out=${out}"
echo "  system=${system}"
echo '}'

echo
echo 'Environment: {'
/usr/bin/env | /usr/bin/sort | /usr/bin/sed -e 's/^/  /'
echo '}'

/bin/mkdir -p ${out}/bin
/bin/cat >${out}/bin/foo-bar <<!
#!/bin/sh

echo Hello
!
/bin/chmod +x ${out}/bin/foo-bar
