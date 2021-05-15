let
  nixpkgs = import (builtins.fetchGit {
    url = "https://github.com/nixos/nixpkgs";
    ref = "refs/heads/release-14.12";
    rev = "770822493e3962d795739fafd522e771bfe06e3d";
  }) { };
  lib = import ./lib.nix;
  allPkgs = nixpkgs // pkgs;
  callPackage = path: overrides:
    let f = import path;
    in lib.makeOverridable f ((builtins.intersectAttrs (builtins.functionArgs f) allPkgs) // overrides);
  pkgs = with nixpkgs; rec {
    mkDerivation = import ../pill-12/with-png/autotools.nix nixpkgs;
    hello = callPackage ../pill-12/inputs/hello.nix { };
    graphviz = callPackage ../pill-12/inputs/graphviz.nix { };
    graphvizCore = graphviz.override { gdSupport = false; };
  };
in pkgs
