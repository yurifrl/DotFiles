{ config, pkgs, ... }:

with builtins;
{
  imports = [ <home-manager/nix-darwin> ];

  home-manager = {
    useUserPackages = true;
    users.yurif = { pkgs, ... }: {
      home = {
        file = {
          ".emacs.d" = {
            recursive = true;
            source = builtins.fetchGit {
              url = "https://github.com/syl20bnr/spacemacs";
              ref = "develop";
            };
          };
          ".spacemacs".source = ./spacemacs.el;  
        };
      };
      programs = {
        emacs.enable = true;
        alacritty = {
          settings = {
            font = {
              size = 26.0;
            };
          };
        };
        fish = {
          enable = true;
          plugins = [{
            name="foreign-env";
            src = pkgs.fetchFromGitHub {
              owner = "oh-my-fish";
              repo = "plugin-foreign-env";
              rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
              sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
            };
          }];
          shellInit =
          ''
          # nix
          if test -e  /Users/yurif/.nix-profile/etc/profile.d/nix.sh
              fenv source  /Users/yurif/.nix-profile/etc/profile.d/nix.sh
          end
          '';
          shellAliases = {
            ".." = "cd ..";
            x = "exit";
            ls = "ls";
            l = "ls -l";
            ll = "ls -l";
            la = "ls -la";
            grep = "grep --color=tty -d skip";
            cp = "cp -i";                        # Confirm before overwriting somethin"
            df = "df -h";                        # Human-readable size"
            free = "free -m";                    # Show sizes in M"
            ag = "ag --path-to-ignore ~/.ignore";
            close = "tmux kill-window -t";
            rm = "rm -irv";
            gitignored = "git ls-files --others -i --exclude-standard";
            kill_tmux_session = "tmux kill-session";
            c = "git rebase --continue";
            s = "git rebase --skip";
            m = "git mergetool";
            lg = "gitui";
            gui = "gitui";
            w = "cd $HOME/Workdir/github.com/yurifrl";
            g = "git";
            gti = "git";
            chmod = "chmod --preserve-root";
            chown = "chown --preserve-root";
            k = "run/current-system/sw/bin/kubect";
            proj = "touch .projectile";
          };
        };
        vim = {
          enable = true;
        };
        git = {
          enable = true;
          userEmail = "yurifl03@gmail.com";
          userName = "yurifrl";
          # signing.key = "GPG-KEY-ID";
          # signing.signByDefault = true;
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
        };
        tmux = {
          shell = "fish";
          enable = true;
          extraConfig = (readFile ./tmux.conf);
        };
      };
    };
  };
}
