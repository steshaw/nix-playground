#
# See https://nixos.org/nixpkgs/manual/#how-to-build-a-haskell-project-using-stack
#
with (import <nixpkgs> { });
haskell.lib.buildStackProject {
  name = "rio-example";
  buildInputs = [ ];
}
