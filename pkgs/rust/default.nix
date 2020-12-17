{ stdenv, ... }:

let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
  ruststable = (nixpkgs.latest.rustChannels.stable.rust.override { extensions = [ "rust-src" "rls-preview" "rust-analysis" "rustfmt-preview" ];});
in
  with nixpkgs;
  stdenv.mkDerivation {
    name = "rust";
    # unpackPhase = "true";
    # phases = [ "installPhase" "fixupPhase" ];
    src = builtins.filterSource (path: type: false) ./.;
    buildInputs = [ openssl pkg-config nasm rustup ruststable cmake zlib ];
  }
