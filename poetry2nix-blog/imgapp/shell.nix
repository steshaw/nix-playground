with (import <nixpkgs> { });
(python3.withPackages (
  ps: with ps; [ flask pillow requests ]
)).env
