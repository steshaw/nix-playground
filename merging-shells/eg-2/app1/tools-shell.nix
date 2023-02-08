{ pkgs ? import ../nix { }
}:
pkgs.mkShell {
  inputsFrom = [
    (import ../tools.nix { pkgs = pkgs; })
  ];
  packages = [
    pkgs.poetry
    pkgs.python310
  ];
}
