{ pkgs ? import ../nix { }
}:
pkgs.mkShell {
  inputsFrom = [
    (import ../tools.nix { pkgs = pkgs; })
  ];
  packages = [ pkgs.buildPackages.ruby_2_7 ];
}
