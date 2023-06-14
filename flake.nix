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
      url = "github:MrcJkb/haskell-tools.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, haskell-tools-nvim, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in
  with nixpkgs.lib;
  {
    nixosModules.default = { config, lib, ... }:
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
      customPlugins = lib.attrsets.mapAttrsToList
      (key: value: value)
      (import ./plugins.nix { inherit pkgs lib; });
      lsp-servers = lib.attrsets.mapAttrsToList
      (key: value: value)
      (import ./lsp-servers.nix { inherit pkgs lib; });
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
        home.file.".config/nvim/lua".source = lua; # Import config

        # Doc Here:
        # https://github.com/NixOS/nixpkgs/blob/nixos-22.11/doc/languages-frameworks/vim.section.md
        programs.neovim = {
          enable = true;
          withNodeJs = true;
          withPython3 = true;
          vimAlias = true;
          viAlias = true;
          vimdiffAlias = true;
          extraLuaConfig = ''

          omnisharp_path = "${pkgs.omnisharp-roslyn}/lib/omnisharp-roslyn/OmniSharp.dll"
          '' + init;

          nixpkgs.overlays = [ haskell-tools-nvim.overlays.default ];

          plugins = with pkgs.vimPlugins; [
            nvim-treesitter.withAllGrammars
            nvim-treesitter-context
            vim-sleuth
            {
              plugin = sqlite-lua;
              config = ''
              let g:sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.so'
              '';
            }
            nvim-neoclip-lua
            nvim-lspconfig
            go-nvim
            nvim-surround
            vim-illuminate
            nvim-dap
            nvim-dap-ui
            nui-nvim
            vim-kitty-navigator
            gitsigns-nvim
            nvim-colorizer-lua
            vim-nix
            go-nvim
            todo-comments-nvim
            comment-nvim
            luasnip
            nvim-web-devicons
            plenary-nvim
            rest-nvim
            catppuccin-nvim
            galaxyline-nvim
            alpha-nvim
            mkdir-nvim
            yankring
            coq-artifacts
            undotree
            which-key-nvim
            markdown-preview-nvim
            vim-markdown-toc
            mini-nvim
            crates-nvim
            trouble-nvim
            # Telescope
            telescope-nvim
            telescope-symbols-nvim
            telescope-zoxide
            popup-nvim
            haskell-tools-nvim
          ] ++ customPlugins;

          extraPackages = with pkgs; [
            graphviz
            universal-ctags
            watchman
            python310Packages.virtualenv
            ripgrep
            dotnet-sdk
            viu
            xclip
          ] ++ lsp-servers;
        };
      }]);
    };
  };
}

