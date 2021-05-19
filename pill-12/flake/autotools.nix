pkgs: system: attrs:
let
  defaultAttrs = with pkgs; {
    builder = "${bash}/bin/bash";
    args = [ ./builder.sh ];
    setup = ./setup.sh;
    baseInputs = [
      # binutils-unwrapped – was not yet added in Nixpkgs version 14.x
      binutils
      coreutils
      findutils
      gawk
      gcc
      gnugrep
      gnumake
      gnused
      gnutar
      gzip
      patchelf
    ];
    buildInputs = [ ];
    inherit system;
  };
in derivation (defaultAttrs // attrs)
