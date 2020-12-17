
{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  home-manager = {
    users.yurif = { pkgs, ... }: {
      home = {
        # File Configs
        file = {
          ".config/fish/fishfile" = {
            recursive = true;
            text =
            ''
            matchai/spacefish
            joehillen/ev-fish
            '';
          };
        };
      };
      programs = {
        fish = {
          enable = true;
          # plugins = [
          #   {
          #     name = "foreign-env";
          #     src = pkgs.fetchFromGitHub {
          #       owner = "oh-my-fish";
          #       repo = "plugin-foreign-env";
          #       rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
          #       sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
          #     };
          #   }
          # ];
          shellInit =
          ''
          # install plugins installer
          if not functions -q fisher
              curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
              fish -c fisher
          end

          # Symlink the ssh folder
          ln -sfn $KEYBASE/home/ssh $HOME/.ssh

          # Load Envs
          ev -q "$KEYBASE/envs"
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
            wy = "cd $HOME/WorkDir/github.com/yurifrl";
            w = "cd $HOME/WorkDir/github.com/team-telnyx";
            g = "git";
            gti = "git";
            k = "kubectl";
            proj = "touch .projectile";
            gh = "git-hub";
            vrau = "cd $HOME/DotFiles & brew bundle install";
            uvrau = "cd $HOME/DotFiles & brew bundle cleanup";
          };
        };
      };
    };
  };
}
