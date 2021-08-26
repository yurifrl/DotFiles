
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

          # Env for ls
          set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD

          # Disable docker for spacefish
          set -Ux SPACEFISH_DOCKER_SHOW "false"

          # It makes new lines slow
          set -Ux SPACEFISH_ELIXIR_SHOW "false"

          # Set default
          set -Ux MIX_ENV "test"

          # Load asdf
          source /usr/local/opt/asdf/asdf.fish
          '';
          functions = {
            ls = {
              body = "command ls -G $argv";
            };
            dotenv = {
              body = ''
                set -l envfile ".env"
                if [ (count $argv) -gt 0 ]
                  set envfile $argv[1]
                end

                if test -e $envfile
                  for line in (cat $envfile)
                    set -xg (echo $line | cut -d = -f 1) (echo $line | cut -d = -f 2-)
                  end
                end
              '';
            };
          };
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
            uvrau = "cd $HOME/DotFiles & brew bundle cleanup -f";
            vraug = "brew bundle install --global";
            uvraug = "brew bundle cleanup -f --global";
            macunfuckafterupdate = "xcode-select --install";
            listpath = ''echo $PATH | tr " " "\n" | nl'';
            asdf_fix_node = ''asdf reshim nodejs'';
            npx = "npx --package=git-mob";
            t = "mix t";
            tt = "mix test";
            ti = "MIX_ENV=test iex -S mix tix";
          };
        };
      };
    };
  };
}
