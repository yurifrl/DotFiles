{ config, pkgs, ... }:

with builtins;
let
  modules = import ./modules;
  me = "yurif";
  keybase = "$HOME/KeybaseTmp/private/yurifrl";
in {
  imports = [
    ./home
    # modules.vscode
  ];

  nixpkgs.config = {
    # Allow unfree
    allowUnfree = true;

    # my custom packages
    packageOverrides = pkgs: {
      yuri = pkgs.callPackage ./pkgs {};
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs;[
    ag
    alacritty
    elixir
    emacs
    git-hub
    gitAndTools.diff-so-fancy
    gitAndTools.gitui
    powerline-fonts
    ranger
    tmux
    vim
    yuri.elixir-ls
    yuri.osxfuse
  ];

  # Environment Variables enabled system wide?
  # needs shell complete reboot
  environment.variables = {
    EDITOR = "vim";
    # Disable docker for spacefish
    SPACEFISH_DOCKER_SHOW = "false";
    KEYBASE = keybase;
  };

  nix = {
    gc = {
      user = "yurif";
      automatic = true;
      # dates = "03:15";
    };
  };

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  # Not using as daemon
  # services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Needs this here
  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.fish.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Suppose to fix applications not showing in the applications folder
  # https://github.com/LnL7/nix-darwin/issues/139#issuecomment-666771621
  # https://github.com/LnL7/nix-darwin/issues/214
  system.activationScripts.applications.text = pkgs.lib.mkForce (''
      echo "setting up ~/Applications/Nix..."
      rm -rf ~/Applications/Nix
      mkdir -p ~/Applications/Nix
      chown ${me} ~/Applications/Nix
      find ${config.system.build.applications}/Applications -maxdepth 1 -type l | while read f; do
        src="$(/usr/bin/stat -f%Y $f)"
        appname="$(basename $src)"
        osascript -e "tell app \"Finder\" to make alias file at POSIX file \"/Users/${me}/Applications/Nix/\" to POSIX file \"$src\" with properties {name: \"$appname\"}";
    done
  '');
}
