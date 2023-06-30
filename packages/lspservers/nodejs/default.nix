{ pkgs, nodejs, stdenv }:

let
  nodePackages = import ./composition.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };
  commitlint-format-json = nodePackages.commitlint-format-json.override {
    dontNpmInstall = true;
  };
in
nodePackages // {
  commitlint = nodePackages."@commitlint/cli".override {
    buildInputs = [ commitlint-format-json ];
  };
}

