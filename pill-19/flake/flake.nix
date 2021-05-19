{
  description = "Hello";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system: {

    defaultPackage =
      with import nixpkgs { inherit system; };
      stdenv.mkDerivation {
        name = "hello";
        src = ../../tars/hello-2.10.tar.gz;
      };
  });
}
