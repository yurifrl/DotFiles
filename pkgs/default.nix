{ pkgs ? import <nixpkgs> { }, ... }:

{
  elixir-ls = pkgs.callPackage ./elixir-ls { };
  osxfuse = pkgs.callPackage ./osxfuse { };
}
