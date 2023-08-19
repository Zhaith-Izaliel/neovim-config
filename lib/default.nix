{ lib, pkgs }:

let
  mkDate = longDate: (lib.concatStringsSep "-" [
    (builtins.substring 0 4 longDate)
    (builtins.substring 4 2 longDate)
    (builtins.substring 6 2 longDate)
  ]);
in
{
  pluginsToList = plugins: lib.attrsets.mapAttrsToList
    ( name: value:
      pkgs.vimUtils.buildVimPluginFrom2Nix {
        pname = name;
        version = "${mkDate (value.lastModifiedDate or
        "19700101")}_${value.shortRev or "dirty"}";
        src = value;
      }
    )
    plugins;
}

