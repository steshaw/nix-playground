#!/usr/bin/env bash

declare -xp
declare baseInputs buildInputs name out src

unpackPhase() {
  tar -xf "$src"
  cd "${name}"*
}

configurePhase() {
  ./configure --prefix="$out"
}

buildPhase() {
  make
}

installPhase() {
  make install
}

fixupPhase() {
  find "$out" -type f -exec patchelf --shrink-rpath '{}' \; -exec strip '{}' \;
}

genericBuild() {
  unpackPhase
  configurePhase
  buildPhase
  installPhase
  fixupPhase
}

unset PATH
for p in $baseInputs $buildInputs; do
  export PATH=$p/bin${PATH:+:${PATH}}
done
