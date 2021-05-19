{
  description = "Hello with generic autotools builder";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.09;
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system: rec {

    defaultPackage =
      let
        pkgs =  import nixpkgs { inherit system; };
        mkDerivation = import ./autotools.nix pkgs system;
      in
      mkDerivation {
        name = "hello";
        src = ../../tars/hello-2.10.tar.gz;
      };
    });
}
