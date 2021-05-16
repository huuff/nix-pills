# currently graphviz doesn't work with png since the instructions for building it so in the nix-pills guide used version 14-12 of nixpkgs, which aren't flake-supported.
{
  description = "A repository flake";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;

  outputs = { self, nixpkgs }: let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      mkDerivation = import ./autotools.nix pkgs system;
  in {
    packages.x86_64-linux.hello = import ./hello.nix { inherit mkDerivation; };

    packages.x86_64-linux.graphvizCore = with pkgs; import ./graphviz.nix {
      inherit mkDerivation gd fontconfig libjpeg bzip2;
      gdSupport = false;
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

  };
}
