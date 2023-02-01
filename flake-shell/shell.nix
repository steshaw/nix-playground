{ pkgs ? import ./nix { } }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    go_1_18
    nodePackages.prettier
    cargo
    python38
    openssl
  ];
}
