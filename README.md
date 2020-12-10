# Yuri's OS X Dotfiles

## Install Nix and Nix Darwing

- [nix guide](https://hydra.nixos.org/build/119559243/download/1/manual/#sect-macos-installation)

- [nix darwing](https://github.com/LnL7/nix-darwin)

### Removing
```
To uninstall:

# Remove the entry from fstab using
sudo vifs


# Get the volume "APFS Volume Disk (Role)"
diskutil apfs list

# Destroy the data volume using
diskutil apfs deleteVolume <role>

# Remove the nix line from synthetic.conf
sudo vim /etc/synthetic.conf

# Search for daemons and unload and remove if any
sudo ls /Library/LaunchDaemons/

# Clear files
sudo rm -rf etc/nix /nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels
rm -rf ~/.nix-profile ~/.nix-defexpr ~/.nix-channels
```

## Install

### Nix Commands

```
# Update nix channel
nix-channel --update

# Rebuild install stuff
darwin-rebuild switch

# Get sha256 for git url
nix-prefetch-git <url> --rev v0.1.1

# Get sha256 for github url
nix-prefetch-url --unpack <url>

# Delete old generations
nix-env --delete-generations old

# Garbage collect
nix-collect-garbage -d

# After you garbage collect it clear's cache run search to setup things up
nix search -u

# Open nix repl
nix repl
:l <nixpkgs>

# Tets a single derivation
nix-build -E 'with import <nixpkgs> { };  callPackage ./default.nix {}'
```

#### Brew

Not everything can be installed with nix
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install
brew bundle install

# Cleanup
brew bundle cleanup
```

### Reference

- [nix darwin manual](https://daiderd.com/nix-darwin/manual/index.html)
- [remove warnings](https://github.com/LnL7/nix-darwin/issues/105)
- [nice guide](https://github.com/hardselius/dotfiles)
- [nice guide](https://alexn.org/wiki/nix.html)
- [instalation guide](https://gist.github.com/chriselsner/3ebe962a4c4bd1f14d39897fc5619732)
- [A nix on catalina guide](https://gist.github.com/chriselsner/3ebe962a4c4bd1f14d39897fc5619732)
- [Nix and home manager on mac os reddit thread](https://www.reddit.com/r/emacs/comments/jlt7ky/nix_and_home_manager_on_macos/)
- [Nix and home manager on mac os reddit blog post](https://luca.cambiaghi.me/nix-package-manager)
- [A random instalation scriot](https://github.com/iknow/nix-darwin-template/blob/master/install.sh)
- [The official installation script](https://github.com/NixOS/nix/blob/master/scripts/create-darwin-volume.sh)
- [nix darwin manual](https://daiderd.com/nix-darwin/manual/index.html)
- [brew and nix](https://www.mathiaspolligkeit.de/dev/exploring-nix-on-macos/)
