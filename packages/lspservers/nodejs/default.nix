{ pkgs, nodejs, stdenv }:

let
  nodePackages = import ./composition.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };
  commitlint-format-json = nodePackages.commitlint-format-json;
in
nodePackages // {
  commitlint = nodePackages."@commitlint/cli".overrideAttrs (finalAttrs:
  prevAttrs: {
    buildPhase = ''
      ln -s ${commitlint-format-json}/lib/node_modules ./node_modules
    '' + prevAttrs.buildPhase;
  });
}

