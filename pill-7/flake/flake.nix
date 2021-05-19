{
  description = "Simple!";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system: rec {
      defaultPackage = with import nixpkgs { inherit system; };
      derivation {
        name = "simple";
        builder = "${bash}/bin/bash";
        src = ./simple.c;
        inherit system gcc coreutils;
        args = [./simple_builder.sh ];
      };
    });
}
