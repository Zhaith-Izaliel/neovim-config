{ pkgs, nodejs, stdenv }:

let
  nodePackages = import ./composition.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };
in
  nodePackages // {
    commitlint = nodePackages."@commitlint/cli".override {
      buildInputs = [ nodePackages.commitlint-format-json ];
    };
  }

