let
  overlay = self: super: {
    flask-example = self.poetry2nix.mkPoetryApplication {
      projectDir = ./.;
    };
  };
  hostPkgs = import <nixpkgs> {
    overlays = [ overlay ];
  };
  linuxPkgs = import <nixpkgs> {
    overlays = [ overlay ];
    system = "x86_64-linux";
  };
in
{
  inherit (hostPkgs) flask-example;

  docker = hostPkgs.dockerTools.streamLayeredImage {
    name = "flask-example";
    contents = [ linuxPkgs.flask-example ];
    config.Cmd = [ "flask-example" ];
  };
}
