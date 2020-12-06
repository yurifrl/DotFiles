# Yuri's Macos Dotfiles

## Install Nix and Nix Darwing

- [nix guide](https://hydra.nixos.org/build/119559243/download/1/manual/#sect-macos-installation)

- [nix darwing](https://github.com/LnL7/nix-darwin)

### Removing

```
Creating volume and mountpoint /nix.

    ------------------------------------------------------------------ 
  | This installer will create a volume for the nix store and        |
  | configure it to mount at /nix.  Follow these steps to uninstall. |
    ------------------------------------------------------------------ 

1. Remove the entry from fstab using 'sudo vifs'
2. Destroy the data volume using 'diskutil apfs deleteVolume'
3. Remove the 'nix' line from /etc/synthetic.conf or the file

```

### Commands

- nix-channel --update
- darwin-rebuild switch
