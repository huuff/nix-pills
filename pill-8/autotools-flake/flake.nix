{
  description = "Hello with generic autotools builder";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.09;

  outputs = { self, nixpkgs }: {


    defaultPackage.x86_64-linux =
      let
        system = "x86_64-linux";
        pkgs =  import nixpkgs { inherit system; };
        mkDerivation = import ./autotools.nix pkgs system;
      in
      mkDerivation {
        name = "hello";
        src = ../../tars/hello-2.10.tar.gz;
      };
  };
}
