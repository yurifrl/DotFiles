
{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  home-manager = {
    users.yurif = { pkgs, ... }: {
      home = {
        # File Configs
        file = {
          ".Brewfile" = {
            text =
              ''
                tap "homebrew/bundle"
                tap "homebrew/core"          
              '';
          };
        };
      };
    };
  };
}
