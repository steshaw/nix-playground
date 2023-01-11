{ useFix ? false }:
let
  pkgs = self:
    builtins.trace "pkgs" { a = 3; b = 4; c = self.a + self.b; };
  fix = f: let r = builtins.trace "fix.f" (f r); in r;
in
{
  pkgs = pkgs (pkgs pkgs);
  pkgs-fix = fix pkgs;
}
