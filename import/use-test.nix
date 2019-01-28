let f = import ./test.nix;
in f { a = 5; trueMsg = "okay"; }
