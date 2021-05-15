let
  pkgs = import (builtins.fetchGit {
    url = "https://github.com/NixOS/nixpkgs.git";
    ref = "refs/tags/20.09";
    rev = "aea7242187f21a120fe73b5099c4167e12ec9aab";
  }) { };
in
with pkgs;
derivation {
  name = "hello";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  buildInputs = [ gnutar gzip gnumake gcc binutils-unwrapped coreutils gawk gnused gnugrep ];
  src = ../../tars/hello-2.10.tar.gz;
  system = builtins.currentSystem;
}
