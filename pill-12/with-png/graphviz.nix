let
  pkgs = import (builtins.fetchGit {
    url = "https://github.com/nixos/nixpkgs";
    ref = "refs/heads/release-14.12";
    rev = "770822493e3962d795739fafd522e771bfe06e3d";
  }) { };
  mkDerivation = import ./autotools.nix pkgs;
  src = ../../tars/graphviz-2.38.0.tar.gz;
in mkDerivation {
  name = "graphviz";
  inherit src;
  buildInputs = with pkgs; [ gd fontconfig libjpeg bzip2 ];
}
