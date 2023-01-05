{ nixpkgs ? import <nixpkgs> { } }:
{
  hello = import ./hello;
  graphiz = import ./graphiz;
}
