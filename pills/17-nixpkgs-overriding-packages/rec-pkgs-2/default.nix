let
  pkgsO = overrides: self:
    builtins.trace "pkgs" {
      a = 3;
      b = 4;
      c = self.a + self.b;
      d = self.c * self.c;
    } // overrides;
  fix = f: let r = builtins.trace "fix.f" (f r); in r;
  overrides = { a = 1; b = 2; };
in let
  pkgs = pkgsO {};
  pkgs-app = pkgs (pkgs (pkgs pkgs));
  pkgs-fix = fix pkgs;
  newpkgs = let newpkgs = pkgs (newpkgs // overrides); in newpkgs;
  newpkgs2 = let newpkgs = pkgs (newpkgs // overrides); in newpkgs // overrides;

  opkgs = fix (pkgsO overrides);
  all = {
    inherit pkgs-app pkgs-fix newpkgs newpkgs2 opkgs;
  };
in
all // {
  list = ["pkgs-app" "pkgs-fix" "newpkgs" "newpkgs2" "opkgs"];
}
