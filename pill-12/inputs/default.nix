let 
  pkgs = import (builtins.fetchGit {
    url = "https://github.com/nixos/nixpkgs";
    ref = "refs/heads/release-14.12";
    rev = "770822493e3962d795739fafd522e771bfe06e3d";
  }) { };
  mkDerivation = import ../with-png/autotools.nix pkgs;
in with pkgs; {
  hello = import ./hello.nix { inherit mkDerivation; };
  graphviz = import ./graphviz.nix { inherit mkDerivation gd fontconfig libjpeg bzip2; };
  graphvizCore = import ./graphviz.nix {
    inherit mkDerivation gd fontconfig libjpeg bzip2;
    gdSupport = false;
  };
}
