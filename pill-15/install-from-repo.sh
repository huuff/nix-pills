#! /usr/bin/env bash

# not too portable
export NIX_PATH="mypkgs=../pill-14:$NIX_PATH"
nix-env -f '<mypkgs>' -iA graphviz
