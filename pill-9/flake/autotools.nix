pkgs: system: attrs:
  with pkgs;
  let defaultAttrs = {
    builder = "${bash}/bin/bash";
    args = [ ../builder.sh ];
    baseInputs = [ gnutar gzip gnumake gcc binutils-unwrapped coreutils gawk gnused gnugrep findutils patchelf ];
    buildInputs = [];
    inherit system;
  };
  in
  derivation (defaultAttrs // attrs)
