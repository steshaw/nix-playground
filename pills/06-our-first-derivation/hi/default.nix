derivation {
  name = "foo";
  builder = ./build;
  system = "x86_64-linux";

  # Strings
  v1 = "this is a string";
  # Numbers
  v2 = 42;
  # Path
  v3 = ./default.nix;
  # Derivation
  v4 = "TODO";
  # Lists
  v5 = [ "a-string" 1 2 3 "hi" ./default.nix ./build ];
  # True, false, null
  v6 = true;
  v7 = false;
  v8 = null;
}
