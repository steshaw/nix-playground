builtins.derivation {
  name = "first";
  builder = "/bin/sh";
  args = [ ./build ];
  system = "x86_64-linux";
  buildInputs = [
    ./fred.txt
    ./wilma.txt
  ];
}
