{ pkgs ? import <nixpkgs> { } }:
{
  hello = import ./hello { inherit pkgs; };
  graphiz = import ./graphiz { inherit pkgs; };
}
