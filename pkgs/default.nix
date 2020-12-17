{ pkgs ? import <nixpkgs> { }, ... }:

{
  elixir-ls = pkgs.callPackage ./elixir-ls { };
  osxfuse = pkgs.callPackage ./osxfuse { };
  rust = pkgs.callPackage ./rust { };
  git-hooks = pkgs.callPackage ./git-hooks { };
}
