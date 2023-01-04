#!/usr/bin/env bash

declare -xp
declare baseInputs buildInputs

unset PATH
for p in $baseInputs $buildInputs; do
  export PATH=$p/bin${PATH:+:${PATH}}
done
