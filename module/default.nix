{ self }:

{ config, lib, stdenv, pkgs, ... }:
let
  cfg = config.programs.neovim.zhaith-config;
  configPackage = pkgs.stdenv.mkDerivation {
    name = "zhaith-neovim-config";
    src = self;
    installPhase = ''
    mkdir -p $out
    cp -r --target-directory $out lua init.lua
    '';
  };
  init = builtins.readFile "${configPackage}/init.lua";
  lua = lib.sources.cleanSource "${configPackage}/lua";
  dependencies = (import ../dependencies { inherit pkgs stdenv; });
  localLib = import ./lib { inherit pkgs lib; };
  oldPlugins = (import ../plugins { inherit pkgs lib; });
in
  with lib;
  {
    options = {
      programs.neovim.zhaith-config = {
        enable = mkOption {
          default = false;
          example = true;
          type = types.bool;
          description = ''
          Enable Zhaith's Neovim config
          '';
        };
      };
    };
    config = mkIf cfg.enable (mkMerge [{
      home.file.".config/nvim/lua".source = lua; # Import config

      nixpkgs.overlays = [
        inputs.haskell-tools-nvim.overlays.default
        inputs.nil.overlays.default
        (final: prev: import ../overlay { inherit final prev; })
      ];

        # Doc Here:
        # https://github.com/NixOS/nixpkgs/blob/nixos-22.11/doc/languages-frameworks/vim.section.md
        programs.neovim = {
          plugins = oldPlugins ++ localLib.pluginsToList plugins;
          enable = true;
          withNodeJs = true;
          withPython3 = true;
          vimAlias = true;
          viAlias = true;
          vimdiffAlias = true;
          extraPackages = dependencies.packages;
          extraLuaConfig = ''

          omnisharp_path = "${pkgs.omnisharp-roslyn}/lib/omnisharp-roslyn/OmniSharp.dll"
          '' + init;
        };
      }]);
    }

