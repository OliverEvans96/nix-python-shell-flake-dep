{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";
    flake-utils.url = "github:numtide/flake-utils";
    flower-power.url = "github:oliverevans96/nix-python-library-example";
  };
  outputs = { self, nixpkgs, flake-utils, flower-power }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        projectDir = ./.;
        python = pkgs.python38;
        finalPython = python.override { packageOverrides = flower-power.overlay.${system}; };
        pythonEnv = finalPython.withPackages (ps: [
          ps.flower-power
        ]);
      in
      {
        defaultPackage = pythonEnv;
        devShell = pythonEnv.env;
      });
}
