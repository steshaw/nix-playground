let
  # callPackage : PkgSet Path OverridesSet -> PkgSet
  callPackageWithPkgSet = pkgSet: pathToMkPkg: overrides:
    let mkPkg = import pathToMkPkg; in mkPkg
      ((builtins.intersectAttrs
        (builtins.functionArgs mkPkg)
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
