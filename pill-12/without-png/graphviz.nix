let
  pkgs = import (builtins.fetchGit {
    url = "https://github.com/NixOS/nixpkgs.git";
    ref = "refs/tags/20.09";
    rev = "aea7242187f21a120fe73b5099c4167e12ec9aab";
  }) { };
  mkDerivation = import ../../pill-10/autotools.nix pkgs;
in mkDerivation {
  name = "graphviz";
  src = ../../tars/graphviz-2.38.0.tar.gz;
}
