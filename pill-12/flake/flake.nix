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
      mkDerivation = import ./autotools.nix pkgs system;
    in rec {
    packages.hello = import ./hello.nix { inherit mkDerivation; };

    packages.graphvizCore = with pkgs; import ./graphviz.nix {
      inherit mkDerivation gd fontconfig libjpeg bzip2;
      gdSupport = false;
    };


    packages.graphviz = with pkgs; import ./graphviz.nix {
      inherit mkDerivation gd fontconfig libjpeg bzip2;
    };

    defaultPackage = packages.hello;

  });
}
