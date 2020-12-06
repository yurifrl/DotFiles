{ config, pkgs, ... }:

let
  mktplaceExt = import ./ext.nix;

  # extensions = (with pkgs.vscode-extensions; [
  #   # ms-vscode.cpptools
  #   # bbenoist.Nix
  # ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace mktplaceExt.extensions;

  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscodeExtensions = mktplaceExt.extensions;
  };
  cfg = config.yuri.programs.ghcide;

in {
  config.environment.systemPackages = [
    # unstable.vscode
    vscode-with-extensions
  ];
}
