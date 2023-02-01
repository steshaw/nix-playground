let
  flake = builtins.getFlake (toString ./.);
in
builtins.trace "flake = ${flake}" flake.devShells.${builtins.currentSystem}.default
