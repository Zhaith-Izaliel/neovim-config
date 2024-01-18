{ overlays, plugins, package }:

{ config, lib, stdenv, pkgs, ... }:
let
  cfg = config.programs.neovim.zhaith-config;
  init = builtins.readFile "${package}/init.lua";
  packagePath = lib.cleanSource "${package}";
  dependencies = (import ./dependencies.nix { inherit pkgs stdenv; }).packages;
in
{
  options = {
    programs.neovim.zhaith-config = {
      enable = lib.mkEnableOption "Zhaith Neovim configuration";
    };
  };
  config = lib.mkIf cfg.enable {
    home.file.".config/nvim/lua".source = "${packagePath}/lua"; # Import config
    home.file.".config/nvim/after/ftplugins".source = "${packagePath}/after/ftplugin";
    home.file.".config/nvim/ftplugins".source = "${packagePath}/ftplugin";

    nixpkgs = {
      inherit overlays;
    };

    programs.neovim = {
      enable = true;
      withNodeJs = true;
      withPython3 = true;
      vimAlias = true;
      viAlias = true;
      vimdiffAlias = true;
      extraPackages = dependencies;
      plugins = (with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
        nvim-treesitter-context
        haskell-tools-nvim
      ]) ++ lib.attrsets.mapAttrsToList (name: value: value) plugins;
      extraLuaConfig = ''

      vim.g.sqlite_clib_path = "${pkgs.sqlite.out}/lib/libsqlite3.so"
      '' + init;
    };
  };
}

