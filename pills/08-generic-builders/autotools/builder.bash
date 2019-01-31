set -euo pipefail

declare buildInputs name out src

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
