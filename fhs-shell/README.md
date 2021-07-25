Invoke the FHS shell with

```sh-session
$ nix-shell --pure .config/nix/fhs.nix
```

or simply

```sh-session
$ fhs
```

To invoke a particular command within the FHS:

```sh-session
$ nix-shell --pure .config/nix/fhs.nix --argstr run 'overmind start'
```

or

```sh-session
$ fhs overmind start
```
