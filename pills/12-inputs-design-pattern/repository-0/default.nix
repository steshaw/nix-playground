let pkgs = import <nixpkgs> {}; in
with pkgs; [
  (writeScriptBin "foo" "echo foo")
  (writeScriptBin "bar" "echo bar")
]
