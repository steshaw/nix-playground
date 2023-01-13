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

  middle-man = stdenv.mkDerivation {
    name = "middle-man";
    propagatedBuildInputs = [ actualHello ];
    dontUnpack = true;
    installPhase = ''
      mkdir -p "$out"
    '';
  };

  wrappedHello = stdenv.mkDerivation {
    name = "hello-wrapper";
    buildInputs = [ middle-man which ];

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
wrappedHello
