let
  pkgs = self:
    builtins.trace "pkgs" { a = 3; b = 4; c = self.a + self.b; };
  fix = f: let r = builtins.trace "fix.f" (f r); in r;
  overrides = { a = 1; b = 2; };
in
{
  pkgs = pkgs (pkgs pkgs);
  pkgs-fix = fix pkgs;
  newpkgs = let newpkgs = pkgs (newpkgs // overrides); in newpkgs;
  newpkgs2 = let newpkgs = pkgs (newpkgs // overrides); in newpkgs // overrides;
}
