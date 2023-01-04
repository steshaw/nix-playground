derivation {
  name = "foo";
  builder = ./script/builder;
  system = builtins.currentSystem;
  args = [ "a" "b" "c" 1 2 3 ];
}
