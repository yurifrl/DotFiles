{ config, lib, pkgs, services, ... }:

# https://github.com/tweag/jupyterWith
# https://github.com/shitikovkirill/NixConfDevServer/blob/master/programmin/jupyter/service/default.nix
with lib;
let
  cfg = config.yuri.programs.jupyter;

  jupyter = import (builtins.fetchGit {
    url = https://github.com/tweag/jupyterWith;
    rev = "";
  }) {};

  ihaskell = jupyter.kernels.iHaskellWith {
    name = "haskell";
    packages = p: with p; [ hvega formatting ];
  };

  # go = jupyter.kernels.gophernotes {
  #   name = "gophernotes";
  # };

  rust = jupyter.kernels.rustWith {
    # Name that will appear in the Jupyter interface
    name = "rust";
    # Extra packages that can be used by the kernel and imported crates
    packages = with pkgs; [ openssl pkgconfig ];
  };

  # myKernels = pkgs.callPackage ./kernels {};

  jupyterEnvironment = jupyter.jupyterlabWith {
    # kernels = [ ihaskell go rust (myKernels.java {}) ];
    kernels = [ ihaskell rust  ];
  };
in {
  config.environment.systemPackages = with pkgs; [
    jupyterEnvironment
    python38Packages.ipykernel
  ];
  # config.services.jupyter = {
  #   enable = true;
  #   password = "password";
  # };
}
