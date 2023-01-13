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
in
actualHello
