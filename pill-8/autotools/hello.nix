let
  pkgs = import (builtins.fetchGit {
    url = "https://github.com/NixOS/nixpkgs.git";
    ref = "refs/tags/20.09";
    rev = "aea7242187f21a120fe73b5099c4167e12ec9aab";
  }) { };
  mkDerivation = import ./autotools.nix pkgs;
in mkDerivation {
  name = "hello";
  src = ../../tars/hello-2.10.tar.gz ;
}
