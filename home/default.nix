{ config, pkgs, ... }:

with builtins;
{
  imports = [
    <home-manager/nix-darwin>
    ./fish.nix
    ./git.nix
    ./alacritty.nix
    ./tmux.nix
    ./emacs.nix
  ];

  home-manager = {
    useUserPackages = true;
    users.yurif = { pkgs, ... }: {
      programs = {
        vim.enable = true;
      };
    };
  };
}
