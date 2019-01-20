with (import <nixpkgs> {});
let node = nodejs-11_x;
in mkShell {
  name = "env";
  buildInputs = [
    docker
    emacs
#    haskellPackages.apply-refact # TODO: Broken in nixpkgs 😞
#    haskellPackages.brittany # TODO: Broken in nixpkgs 😞
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
#
# sudo apt-get -qqy install libtinfo-dev
#
  ];
  shellHook = ''
    #
    # Do not output to stdout here as it gives direnv woes.
    # See https://github.com/direnv/direnv/issues/225
    #
    echo Inside the shell hook >&2
  '';
}
