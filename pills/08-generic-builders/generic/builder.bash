set -euo pipefail

declare buildInputs name out src

declare -xp

unset PATH
for p in $buildInputs; do
  export PATH=$p/bin${PATH:+:${PATH}}
done

echo "PATH = [[$PATH]]"
echo 'PATH = {'
echo "$PATH" | tr ':' '\n' | sed -e 's/^/  /'
echo '}'

tar -xf "$src"

cd "${name}"*

./configure --prefix="$out"
make AR="${AR}" CC="${CC}" RANLIB="${RANLIB}"
make install
