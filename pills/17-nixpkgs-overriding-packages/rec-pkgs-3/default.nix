let
  fix = f: let r = builtins.trace "fix.f" (f r); in r;

  pkgs = self:
    builtins.trace "pkgs" {
      a = 3;
      b = 4;
      c = self.a + self.b;
      d = self.c * self.c;
      f = 9;
    };

  overrides-mixin = self: {
    a = 1;
    b = self.f + 2;
  };

in let
  pkgs-app = pkgs (pkgs (pkgs pkgs));
  pkgs-fix = fix pkgs;
#  newpkgs = let newpkgs = pkgs (newpkgs // overrides); in newpkgs;
#  newpkgs2 = let newpkgs = pkgs (newpkgs // overrides); in newpkgs // overrides;

  all = {
    inherit pkgs-app pkgs-fix;
  };
in
all // {
  list = ["pkgs-app" "pkgs-fix"];
}
