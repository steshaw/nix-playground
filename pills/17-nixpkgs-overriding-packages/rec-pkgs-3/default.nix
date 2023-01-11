let

  fix = f: let r = builtins.trace "fix.f" (f r); in r;

  pkgs = self:
    builtins.trace "pkgs self = hmm" {
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

in
{
  pkgs-app = pkgs (pkgs (pkgs pkgs));
  pkgs-fix = fix pkgs;
  #hmm-app = overrides-mixin (pkgs pkgs);
}
