let
  url =
    "https://github.com/NixOS/nixpkgs/tarball/362be9608c3e0dc5216e9d1d5f5c1a5643b7f7b1";
in
builtins.fetchTarball {
  name = "nixpkgs-circa-2016";
  inherit url;
  sha256 = "0934rhanamsnhawg15gg6cy9ird3c47hsqn5s46lq2n5kzl6v7ly";
}
