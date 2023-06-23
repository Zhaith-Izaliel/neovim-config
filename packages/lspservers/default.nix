{ pkgs, nodejs, stdenv, lib }:

let
  nodePackages = final: import ./composition.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };
in
  lib.makeExtensible nodePackages

