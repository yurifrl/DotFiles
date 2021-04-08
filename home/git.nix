
{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  home-manager = {
    useUserPackages = true;
    users.yurif = { pkgs, ... }: {
      programs = {
        git = {
          enable = true;
          userEmail = "yurifl03@gmail.com";
          userName = "yurifrl";
          signing = {
            key = "85646DD76932F94F448F658E39D11F6BDD0E4BFA";
            signByDefault = true;
            gpgPath = "/usr/local/MacGPG2/bin/gpg2";
          };
          aliases = {
            a = "add";
            ac = "!git chl && git add";
            c = "commit -m";
            s = "!git status";
            l = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --";
            ck = "checkout";
            ci = "!git a . ; git c 'feature: testing ci :rocket:'; git push";
            wip = "!git a . ; git c 'feature: wip :zap:' ; git push";
            tag-v = "!git tag $(cat VERSION); git push origin $(cat VERSION)";
            chl-init = "!git-chglog --init --silent";
            chl = "!chl";
            undo-last-commit = "reset HEAD~";
            add = "!echo 'use lg'";
            commit = "!echo 'use lg'";
            wtf = "!wtc commit -a";
            sync = "!git pull && git push";
          };
          ignores = [
            ".DS_Store"
          ];
          extraConfig = {
            hooks = {
              global = "/Users/yurif/DotFiles/home/config/githooks";
            };
            init = {
              templatedir = "/Users/yurif/.git-template-with-git-hooks";
            };
          };
        };
      };
    };
  };
}
