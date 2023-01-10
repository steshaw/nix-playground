let
  makeOverridable = f: origArgs:
    f origArgs // {
      override = newArgs:
        f (origArgs // newArgs);
    };
in
{
  inherit makeOverridable;
}
