let
  nixpkgs = import <nixpkgs> {};
  allPkgs = nixpkgs // pkgs;
  callPackage = path: overrides:
    let f = import path;
    in f ((builtins.intersectAttrs (builtins.functionArgs f) allPkgs) // overrides);
  pkgs = with nixpkgs; {
    mkDerivation = import ../pill-12/inputs/autotools.nix nixpkgs;
    hello = callPackage ../pill-12/inputs/hello.nix { };
    graphviz = callPackage ../pill-12/inputs/graphviz.nix { };
    graphvizCore = callPackage ../pill-12/inputs/graphviz.nix { gdSupport = false; };
  };
in pkgs
