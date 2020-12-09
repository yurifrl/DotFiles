{ config, pkgs, ... }:

with builtins;
{
  imports = [ <home-manager/nix-darwin> ];

  home-manager = {
    users.yurif = { pkgs, ... }: {
      programs = {
        tmux = {
          shell = "/etc/profiles/per-user/yurif/bin/fish";
          terminal = "xterm-256color";
          enable = true;
          extraConfig = (readFile ./config/tmux.conf);
          plugins = with pkgs; [
            tmuxPlugins.nord
          ];
        };
      };
    };
  };
}
