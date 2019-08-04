with (import <nixpkgs> {});
let node = nodejs-10_x;
    enableApplyRefact = false; # TODO: Broken in nixpkgs 😞
    enableBrittany = false; # TODO: Broken in nixpkgs 😞
    opt = stdenv.lib.optional;
in mkShell {
  name = "env";
  buildInputs = [
    docker
    emacs
    haskellPackages.hasktags
    haskellPackages.hindent
    haskellPackages.hlint
    haskellPackages.hoogle
    haskellPackages.stylish-haskell
    node
    openssl
    overmind
    pkgconfig
    postgresql96
    redis
    shellcheck
    sqitchPg
    stack
    vim
    (yarn.override { nodejs = node; })
    zlib
  ]
  ++ opt enableApplyRefact haskellPackages.apply-refact
  ++ opt enableBrittany haskellPackages.brittany
  ;
  shellHook = ''
    #
    # Do not output to stdout here as it gives direnv woes.
    # See https://github.com/direnv/direnv/issues/225
    #
    echo Inside the shell hook >&2
  '';
}
