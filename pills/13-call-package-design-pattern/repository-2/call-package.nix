let
  callPackage = set: f: overrides: f (
    builtins.intersectAttrs
      (builtins.functionArgs f)
      set // overrides
  );
  add = { a ? 3, b }: a + b;
  values = {
    a = 10;
    b = 32;
    c = 42;
    d = 99;
  };
in
{
  inherit add values callPackage;
  test1 = callPackage values add { };
  test2 = callPackage values add { a = 0; };
}
