#
# From https://github.com/NixOS/nix/issues/1598
#
# Try:
#
#   $ nix-shell --run foo1
#   $ nix-shell --run foo2
#   $ nix-shell --command foo1
#   $ nix-shell --command foo2
#
#   $ nix-shell
#   $ foo1
#   $ exit
#
with (import <nixpkgs> {});
stdenv.mkDerivation {
  name = "foo";
  shellHook = ''
    alias foo1='echo foo1'
    foo2() {
      echo foo2 "$@"
    }
  '';
  XXX_BASHOPTS="expand_aliases";
}
