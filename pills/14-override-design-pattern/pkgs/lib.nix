let
  # callPackage : PkgSet Path OverridesSet -> PkgSet
  callPackageWithPkgSet = pkgSet: pathToF: overrides:
    let f = import pathToF; in f
      ((builtins.intersectAttrs
        (builtins.functionArgs f)
        pkgSet) // overrides);

  makeOverridable = f: origArgs:
    f origArgs // {
      override = newArgs:
        makeOverridable f (origArgs // newArgs);
    };
in
{
  inherit callPackageWithPkgSet makeOverridable;
}
