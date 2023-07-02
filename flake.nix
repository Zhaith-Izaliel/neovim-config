{
  description = "Flake to manage Zhaith-Izaliel's Neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    haskell-tools-nvim = {
      url = "github:mrcjkb/haskell-tools.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in
  with nixpkgs.lib;
  {
    nixosModules.default = { config, lib, stdenv, ... }:
    let
      cfg = config.programs.neovim.zhaith-config;
      configPackage = pkgs.stdenv.mkDerivation {
        name = "zhaith-neovim-config";
        src = "${self}";
        installPhase = ''
        mkdir -p $out
        cp -r --target-directory $out lua init.lua
        '';
      };
      init = builtins.readFile "${configPackage}/init.lua";
      lua = lib.sources.cleanSource "${configPackage}/lua";
      dependencies = (import ./dependencies { inherit pkgs stdenv; });
      plugins = (import ./plugins { inherit pkgs lib; });
    in
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
        home.file = {
          ".config/nvim/lua".source = lua; # Import config
          ".commitlintrc.js".text = dependencies.files.commitlintrc;
        };

        nixpkgs.overlays = [
          inputs.haskell-tools-nvim.overlays.default
          (final: prev: import ./overlay { inherit final prev; })
        ];

        # Doc Here:
        # https://github.com/NixOS/nixpkgs/blob/nixos-22.11/doc/languages-frameworks/vim.section.md
        programs.neovim = {
          plugins = plugins ++ [ haskell-tools-nvim.packages.default ];
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
    };
  };
}

