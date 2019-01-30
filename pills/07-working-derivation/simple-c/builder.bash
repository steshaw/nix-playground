declare -xp
export PATH="$coreutils/bin:$binutils/bin:$gcc/bin"
mkdir -p $out/bin
gcc -o "$out/bin/simple" $src
