{ config, pkgs, lib, ... }:


let
  my-python-packages = python-packages: with python-packages; [
    requests
    paramiko
    click
    easygui
    tkinter
    click
    requests
    pyyaml
    colorama
    tqdm
    pyyaml
  ];
  python-with-my-packages = pkgs.python3.withPackages my-python-packages;
in {
  config.environment.systemPackages = [
    python-with-my-packages
  ];
}
