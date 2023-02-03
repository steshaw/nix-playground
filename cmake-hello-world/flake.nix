{
  inputs.nixpkgs.url = "nixpkgs/release-22.11";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default = import ./default.nix {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    };
  };
}
