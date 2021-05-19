# currently graphviz doesn't work with png since the instructions for building it so in the nix-pills guide used version 14-12 of nixpkgs, which aren't flake-supported.
{
  description = "A repository flake";

  inputs.nixpkgs = {
    url = github:NixOS/nixpkgs/release-14.12;
    flake = false;
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    allPkgs = pkgs // self.packages.x86_64-linux;
    callPackage = path: overrides:
    let 
      f = import path;
    in f ((builtins.intersectAttrs (builtins.functionArgs f) allPkgs) // overrides);
  in {

    packages.x86_64-linux.mkDerivation = import ../../pill-12/flake/autotools.nix pkgs system;

    packages.x86_64-linux.hello = callPackage ../../pill-12/flake/hello.nix {};

    packages.x86_64-linux.graphviz = callPackage ../../pill-12/flake/graphviz.nix {};

    packages.x86_64-linux.graphvizCore = callPackage ../../pill-12/flake/graphviz.nix { gdSupport = false; };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

  };
}
