derivation rec {
  name = "foo";
  builder = ./build;
  system = "x86_64-linux";

  # Strings
  V1 = "this is a string";
  # Numbers
  V2 = 42;
  # Path
  V3 = ./default.nix;
  # Derivation
  V4 = "TODO";
  # Lists
  V5 = [ "a-string" 1 2 3 "hi" ./default.nix ./build ];
  # True, false, null
  V6 = true;
  V7 = false;
  V8 = null;

  args = [ V1 V2 V3 V4 V5 V6 V7 V8 ];
}
