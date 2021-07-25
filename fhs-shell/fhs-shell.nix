{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSUserEnv {
  name = "example-env";
  targetPkgs = pkgs: with pkgs; [
    bat
    coreutils
    exa
    git
    ncurses
    neovim
    which
  ];
  multiPkgs = pkgs: with pkgs; [
    zlib
    xorg.libXxf86vm
    curl
    openal
    openssl
    xorg.libXext
    xorg.libX11
    xorg.libXrandr
    mesa_glu
  ];
  runScript = "${pkgs.bashInteractive_5}/bin/bash";
}).env
