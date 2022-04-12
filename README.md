# Nix Shell with Python Dependency via Nix Flakes

I'm trying to use a nix flake python package (`flower_power`) as an input to a nix shell via `python38.withPackages`.

Run the following to see that it works

```
nix-shell --command "python -c 'from flower_power import *; print(list_many_species())'"
```
