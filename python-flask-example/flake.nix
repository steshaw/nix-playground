{
  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default =
      import ./shell.nix {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
  };
}
