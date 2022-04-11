# Nix Shell with Python Dependency via Nix Flakes

I'm trying to use a nix flake python package (`flower_power`) as an input to a nix shell via `python38.withPackages`.

I would like the following to work

```
nix-shell --command "python -c 'from flower_power import *; print(list_many_species())'"
```

## Current Error

Unfortunately, this is what I'm seeing so far:

```
Traceback (most recent call last):
  File "<string>", line 1, in <module>
ModuleNotFoundError: No module named 'flower_power'
```

