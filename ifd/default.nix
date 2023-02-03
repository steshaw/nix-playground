let
  pkgs = import <nixpkgs> {};
  getHello = pkgs.runCommand "get-hello.nix" {} ''
    # Call any command here to generate an expression. A simple example:
    echo 'pkgs: pkgs.hello' > $out
  '';
in import getHello pkgs
