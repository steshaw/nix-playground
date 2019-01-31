set -euo pipefail

declare -xp

unset PATH
for p in $buildInputs; do
  export PATH=$p/bin${PATH:+:${PATH}}
done

set -x
ls $cc/bin
ls $binutils/bin
ls $llvm/bin
set +x

#export AR=llvm-ar
#export RANLIB=llvm-ranlib
#export CC=clang

echo "PATH = [[$PATH]]"
echo 'PATH = {'
echo $PATH | tr ':' '\n' | sed -e 's/^/  /'
echo '}'

tar -xf $src

cd ${name}*

./configure --prefix=$out
make AR=${AR} CC=${CC} RANLIB=${RANLIB}
make install
