{
  sources ? import ./sources.nix,
  pkgs ? (
    with
      { overlay = _: pkgs:
          { niv = (import sources.niv {}).niv;
          };
      };
      import sources.nixpkgs {
        overlays = [ overlay ];
        config = {};
      }
  ),
  run ? "${pkgs.bashInteractive_5}/bin/bash"
}:
let
  envScript = ../environment;
  certFile = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
in
(pkgs.buildFHSUserEnv {
  name = "fhs";
  targetPkgs = pkgs: with pkgs; [
    bashInteractive_5
    binutils
    curl
    exa
    gcc
    gmp
    haskell.compiler.ghc8104
    haskellPackages.stack
    hostname
    ncurses
    neovim
    overmind
    python3
    which
    zlib
  ];
  profile = ''
    source ${envScript}
    SSL_CERT_FILE=${certFile}
    NIX_SSL_CERT_FILE=${certFile}
    export LANG=C.UTF-8
    PS1="\n$PS1\n\$ "
  '';
  runScript = run;
}).env
