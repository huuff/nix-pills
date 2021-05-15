{
  description = "Simple!";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-linux"; };
      derivation {
        name = "simple";
        builder = "${bash}/bin/bash";
        src = ./simple.c;
        inherit system gcc coreutils;
        args = [ ./simple_builder.sh ];
      };

  };
}
