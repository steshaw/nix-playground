{ pkgs ? import <nixpkgs> { }, foo ? 1 }:
{
  a = pkgs.psmisc;
  b = pkgs.psmisc;
}
