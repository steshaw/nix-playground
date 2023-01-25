#with (import <nixpkgs> { });
#(python3.withPackages (
#  ps: with ps; [ flask pillow requests ]
#)).env

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  buildInputs = [
    pkgs.python3
    pkgs.poetry
  ];

}
