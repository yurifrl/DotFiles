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
          ".config/elisp/restclient-vscode-compatible" = {
            recursive = true;
            source = builtins.fetchGit {
              url = "https://www.yatex.org/gitbucket/git/Asya-kawai/restclient-vscode-compatible.git";
              ref = "master";
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
