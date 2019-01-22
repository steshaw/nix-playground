self: super: {
  my-foobar = self.callPackage ./derivation.nix {};
}
