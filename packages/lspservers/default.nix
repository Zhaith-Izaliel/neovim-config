{ pkgs, nodejs, stdenv }:

let
  nodePackages = final: import ./composition.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };
in
  pkgs.callPackage nodePackages

