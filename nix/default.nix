{ stdenv,
  lib,
  version ? "git"
}:

stdenv.mkDerivation {
  pname = "zhaith-neovim-config";

  inherit version;

  src = lib.cleanSource ../.;

  installPhase = ''
    mkdir $out
    cp -r -t $out lua ftplugin after init.lua
  '';
}

