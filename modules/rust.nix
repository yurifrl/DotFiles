{ config, pkgs, lib, ... }:

# Rust

let
  rustNightlyNixRepo = pkgs.fetchFromGitHub {
    owner = "solson";
    repo = "rust-nightly-nix";
    rev = "9e09d579431940367c1f6de9463944eef66de1d4";
    sha256 = "03zkjnzd13142yla52aqmgbbnmws7q8kn1l5nqaly22j31f125xy";
  };
  rustPackages = pkgs.callPackage rustNightlyNixRepo { };
  rustcLatestBuilder = {buildDate}: rustPackages.rustcWithSysroots {
    rustc = rustPackages.rustc { date = buildDate; };
    sysroots = [
      (rustPackages.rust-std { date = buildDate; })
    ];
  };
in {
  nixpkgs.config.packageOverrides = pkgs: rec {
    cargoLatest = rustPackages.cargo { date = "2016-10-28"; };
    rustcLatest = rustcLatestBuilder { buildDate = "2017-03-16"; };
  };
}
