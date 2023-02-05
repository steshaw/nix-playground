Surprising `bash-interactive` only in nix-shell shell.

```sh-session
$ diff <(nix develop --command ./output-nix-store-paths) <(nix-shell --pure --run ./output-nix-store-paths)
0a1
> /nix/store/38db4p333ibll7r1v151yc5f6ms1fr00-bash-interactive-5.2-p15/bin
```
