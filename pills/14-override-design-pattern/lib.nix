let
  makeOverridable = f: origArgs:
    f origArgs // {
      override = newArgs:
        makeOverridable f (origArgs // newArgs);
    };
in
{
  inherit makeOverridable;
}
