{ config, pkgs, ... }:

with builtins;
{
  imports = [ <home-manager/nix-darwin> ];

  home-manager = {
    users.yurif = { pkgs, ... }: {
      programs = {
        alacritty = {
          enable = true;
          settings = {
            shell = {
              program = "/etc/profiles/per-user/yurif/bin/fish";
            };
            window = {
              startup_mode =  "Maximized";
            };
            font = {
              size = 17.0;
            };
          };
        };
      };
    };
  };
}
