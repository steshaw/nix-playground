{ sources ? import ../nix/sources.nix
, pkgs ? import sources.nixpkgs { overlays = [ ]; config = { }; }
}:
pkgs.mkShell {
  inputsFrom = [
    (import ../tools.nix { pkgs = pkgs; })
  ];
  nativeBuildInputs = [ pkgs.buildPackages.ruby_2_7 ];
}
