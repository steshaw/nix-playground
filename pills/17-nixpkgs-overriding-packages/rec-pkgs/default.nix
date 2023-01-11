{ useFix ? false }:
let
  pkgs = self:
    builtins.trace "pkgs" { a = 3; b = 4; c = self.a + self.b; };
  fix = f: let r = builtins.trace "fix.f" (f r); in r;
in
  if useFix then fix pkgs else pkgs (pkgs pkgs)
