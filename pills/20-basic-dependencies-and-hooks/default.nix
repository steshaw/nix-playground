let
  pkgs = import <nixpkgs> { };
  inherit (pkgs) stdenv fetchurl which;

  actualHello = stdenv.mkDerivation {
    name = "hello-2.3";

    src = fetchurl {
      url = mirror://gnu/hello/hello-2.3.tar.bz2;
      sha256 = "0c7vijq8y68bpr7g6dh1gny0bff8qq81vnp4ch8pjzvg56wb3js1";
    };
  };

  middleMan = stdenv.mkDerivation {
    name = "middle-man";
    myPropagatedPkgs = [ actualHello ];
    dontUnpack = true;
    installPhase = ''
      mkdir -p "$out"
      mkdir -p $out/nix-support
      cat > $out/nix-support/setup-hook <<END
      for pkg in $myPropagatedPkgs; do
        findInputs \$pkg 1 1 # guessing on the offsets
      done
      anEnvHook() {
        local pkg=$1
        echo "XXX: I depend on \"$pkg\""
      }
      echo hostOffset=$hostOffset
      addEnvHooks "$hostOffset" anEnvHook
      END
    '';
  };

  wrappedHello = stdenv.mkDerivation {
    name = "hello-wrapper";
    buildInputs = [ middleMan which ];

    dontUnpack = true;

    installPhase = ''
      which which # don't really need which
      which hello # ensure propogated dependency is on PATH
      mkdir -p "$out/bin"
      cat >"$out/bin/hello" <<END
      #!${stdenv.shell}
      exec ${actualHello}/bin/hello
      END
      chmod +x "$out/bin/hello"
    '';
  };
in
{
  inherit actualHello middleMan wrappedHello;
}
