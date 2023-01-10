let
  # callPackage : PkgSet Path OverridesSet -> PkgSet
  callPackageWithPkgSet = pkgSet: pathToMkPkg: overrides:
    let mkPkg = import pathToMkPkg;
        args = (
          builtins.intersectAttrs
                  (builtins.functionArgs mkPkg)
                  pkgSet
                  ) // overrides;
        pkg = makeOverridable mkPkg args;
    in
      pkg;

  makeOverridable = f: origArgs:
    f origArgs // {
      override = newArgs:
        makeOverridable f (origArgs // newArgs);
    };
in
{
  inherit callPackageWithPkgSet makeOverridable;
}
