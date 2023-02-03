{ pkgs ? import ./nixpkgs.nix { } }:
pkgs.stdenv.mkDerivation {
  name = "hello-world";
  src = ./.;
  buildInputs = [ pkgs.zlib ];
  nativeBuildInputs = [ pkgs.cmake ];
  installPhase = ''
    bin_dir="$out/bin"
    mkdir -p "$bin_dir"
    cp ./hello-world "$bin_dir"
  '';
}
