{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  home-manager = {
    useUserPackages = true;
    users.yurif = { pkgs, ... }: {
      home = {
        # File Configs
        file = {
          ".emacs.d" = {
            recursive = true;
            source = builtins.fetchGit {
              url = "https://github.com/syl20bnr/spacemacs";
              ref = "develop";
            };
          };
          ".spacemacs".source = ./config/spacemacs.el;
        };
      };
      programs = {
        emacs.enable = true;
      };
    };
  };
}
