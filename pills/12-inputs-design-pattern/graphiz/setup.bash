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
  bin_dir=$p/bin
  if [[ -d $bin_dir ]]; then
    export PATH=$bin_dir${PATH:+:${PATH}}
  fi
  pkgconfig_dir=$p/lib/pkgconfig
  if [[ -d $pkgconfig_dir ]]; then
    export PKG_CONFIG_PATH=$pkgconfig_dir${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}
  fi
done
