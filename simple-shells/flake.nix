{
  inputs.nixpkgs.url = "nixpkgs/release-22.11";

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell { };
  };
}
