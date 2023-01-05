#!/usr/bin/env bash

set -euo pipefail
set -x

declare setup
# shellcheck disable=SC1090
source "$setup"
genericBuild
