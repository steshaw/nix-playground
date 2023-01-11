let
  pkgs = self: { a = 3; b = 4; c = self.a + self.b; };
  fix = f: let r = f r; in r;
in
{
  resolved = pkgs (pkgs pkgs);

  resolved_with_fix = fix pkgs;
}
