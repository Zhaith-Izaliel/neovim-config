{ self, overlays, plugins, package }:

{ config, lib, stdenv, pkgs, ... }:
let
  cfg = config.programs.neovim.zhaith-config;
  init = builtins.readFile "${package}/init.lua";
  lua = lib.cleanSource "${package}/lua";
  dependencies = (import ../dependencies { inherit pkgs stdenv; });
in
  with lib;
  {
    options = {
      programs.neovim.zhaith-config = {
        enable = mkEnableOption "Zhaith Neovim configuration";
      };
    };
    config = mkIf cfg.enable {
      home.file.".config/nvim/lua".source = lua; # Import config

      programs.neovim = {
        plugins = localLib.pluginsToList plugins;
        enable = true;
        withNodeJs = true;
        withPython3 = true;
        vimAlias = true;
        viAlias = true;
        vimdiffAlias = true;
        extraPackages = dependencies.packages;
        extraLuaConfig = ''

        omnisharp_path = "${pkgs.omnisharp-roslyn}/lib/omnisharp-roslyn/OmniSharp.dll"
        vim.g.sqlite_clib_path = "${pkgs.sqlite.out}/lib/libsqlite3.so"
        '' + init;
      };
    };
  }

