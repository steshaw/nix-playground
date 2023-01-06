{ pkgs ? import <nixpkgs> { }
, autotoolsDerivation
}:
autotoolsDerivation {
  name = "hello";
  src = builtins.fetchurl {
    url = "http://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz";
    sha256 = "1ayhp9v4m4rdhjmnl2bq3cibrbqqkgjbl3s7yk2nhlh8vj3ay16g";
  };
}
