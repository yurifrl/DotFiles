{ pkgs ? import <nixpkgs> { }, ... }:

{
  elixir-ls = pkgs.callPackage ./elixir-ls { };
}
