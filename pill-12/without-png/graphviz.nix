let
  pkgs = import <nixpkgs> {};
  mkDerivation = import ../../pill-10/autotools.nix pkgs;
in mkDerivation {
  name = "graphviz";
  src = ./../graphviz-2.38.0.tar.gz;
}
