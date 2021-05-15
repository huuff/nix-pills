with import (builtins.fetchGit {
    url = "https://github.com/nixos/nixpkgs";
    ref = "refs/heads/release-14.12";
    rev = "770822493e3962d795739fafd522e771bfe06e3d";
  }) { };
derivation {
  name = "simple";
  builder = "${bash}/bin/bash";
  args = [ ./simple_builder.sh ];
  inherit gcc coreutils;
  src = ./simple.c;
  system = builtins.currentSystem;
}
