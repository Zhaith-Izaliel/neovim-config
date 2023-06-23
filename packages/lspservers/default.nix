{ pkgs, lib, nodejs, stdenv }:

let
  inherit (lib) makeExtensible extends;

  nodePackages = final: import ./composition.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };
in
  makeExtensible (extends nodePackages)

