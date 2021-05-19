# currently graphviz doesn't work with png since the instructions for building it so in the nix-pills guide used version 14-12 of nixpkgs, which aren't flake-supported.
{
  description = "A repository flake";

  inputs.nixpkgs = {
    url = github:NixOS/nixpkgs/release-14.12;
    flake = false;
  };

  inputs.flake-utils.url = "github:numtide/flake-utils";


    outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let 
      pkgs = import nixpkgs { inherit system; };
      allPkgs = pkgs // self.packages.x86_64-linux;
      lib = import ../lib.nix;
      callPackage = path: overrides:
      let f = import path;
      in lib.makeOverridable f ((builtins.intersectAttrs (builtins.functionArgs f) allPkgs) // overrides);
    in rec {

    packages.mkDerivation = import ../../pill-12/flake/autotools.nix pkgs system;

    packages.hello = callPackage ../../pill-12/flake/hello.nix {};

    packages.graphviz = callPackage ../../pill-12/flake/graphviz.nix {};

    packages.graphvizCore = packages.graphviz.override {gdSupport = false; };

    defaultPackage = packages.hello;

  });
}
