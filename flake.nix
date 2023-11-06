{
  description = "Flake to manage Zhaith-Izaliel's Neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    haskell-tools-nvim = {
      url = "github:mrcjkb/haskell-tools.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nil.url = "github:oxalica/nil";
    haskell-snippets = {
      url = "github:mrcjkb/haskell-snippets.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rustaceanvim = {
      url = "github:mrcjkb/rustaceanvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim plugins
    nvim-neogen = {
      url = "github:danymat/neogen";
      flake = false;
    };
    nvim-pounce = {
      url = "github:rlane/pounce.nvim";
      flake = false;
    };
    nvim-telescope = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };
    nvim-telescope-bibtex = {
      url = "github:nvim-telescope/telescope-bibtex.nvim";
      flake = false;
    };
    nvim-nabla = {
      url = "github:jbyuki/nabla.nvim";
      flake = false;
    };
    nvim-typescript-tools = {
      url = "github:pmizio/typescript-tools.nvim";
      flake = false;
    };
    nvim-hypersonic = {
      url = "github:tomiis4/hypersonic.nvim";
      flake = false;
    };
    nvim-hardtime = {
      url = "github:m4xshen/hardtime.nvim";
      flake = false;
    };
    nvim-notify = {
      url = "github:rcarriga/nvim-notify";
      flake = false;
    };
    nvim-tw-values = {
      url = "github:MaximilianLloyd/tw-values.nvim";
      flake = false;
    };
    nvim-sqlite-lua = {
      url = "github:kkharji/sqlite.lua";
      flake = false;
    };
    nvim-vim-sleuth = {
      url = "github:tpope/vim-sleuth";
      flake = false;
    };
    nvim-neoclip-lua = {
      url = "github:AckslD/nvim-neoclip.lua";
      flake = false;
    };
    nvim-lspconfig = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };
    nvim-go = {
      url = "github:ray-x/go.nvim";
      flake = false;
    };
    nvim-nui = {
      url = "github:MunifTanjim/nui.nvim";
      flake = false;
    };
    nvim-illuminate = {
      url = "github:RRethy/vim-illuminate";
      flake = false;
    };
    nvim-smart-split = {
      url = "github:mrjones2014/smart-splits.nvim";
      flake = false;
    };
    nvim-dap = {
      url = "github:mfussenegger/nvim-dap";
      flake = false;
    };
    nvim-dap-ui = {
      url = "github:rcarriga/nvim-dap-ui";
      flake = false;
    };
    nvim-gitsign = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };
    nvim-colorizer = {
      url = "github:NvChad/nvim-colorizer.lua";
      flake = false;
    };
    nvim-nix = {
      url = "github:LnL7/vim-nix";
      flake = false;
    };
    nvim-todo-comments = {
      url = "github:folke/todo-comments.nvim";
      flake = false;
    };
    nvim-comment = {
      url = "github:numToStr/Comment.nvim";
      flake = false;
    };
    nvim-luasnip = {
      url = "github:L3MON4D3/LuaSnip";
      flake = false;
    };
    nvim-web-devicons = {
      url = "github:nvim-tree/nvim-web-devicons";
      flake = false;
    };
    nvim-plenary ={
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };
    nvim-catppuccin = {
      url = "github:catppuccin/nvim";
      flake = false;
    };
    nvim-galaxyline = {
      url = "github:NTBBloodbath/galaxyline.nvim";
      flake = false;
    };
    nvim-alpha = {
      url = "github:goolord/alpha-nvim";
      flake = false;
    };
    nvim-mkdir = {
      url = "github:jghauser/mkdir.nvim";
      flake = false;
    };
    nvim-yanky = {
      url = "github:gbprod/yanky.nvim";
      flake = false;
    };
    nvim-fundo = {
      url = "github:kevinhwang91/nvim-fundo";
      flake = false;
    };
    nvim-which-key = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };
    nvim-markdown-toc = {
      url = "github:mzlogin/vim-markdown-toc";
      flake = false;
    };
    nvim-mini = {
      url = "github:echasnovski/mini.nvim";
      flake = false;
    };
    nvim-crates = {
      url = "github:Saecki/crates.nvim";
      flake = false;
    };
    nvim-trouble = {
      url = "github:folke/trouble.nvim";
      flake = false;
    };
    nvim-telescope-symbols = {
      url = "github:nvim-telescope/telescope-symbols.nvim";
      flake = false;
    };
    nvim-telescope-project = {
      url = "github:nvim-telescope/telescope-project.nvim";
      flake = false;
    };
    nvim-telescope-zoxide = {
      url = "github:jvgrootveld/telescope-zoxide";
      flake = false;
    };
    nvim-popup = {
      url = "github:nvim-lua/popup.nvim";
      flake = false;
    };
    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    nvim-cmp-lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };
    nvim-cmp-buffer = {
      url = "github:hrsh7th/cmp-buffer";
      flake = false;
    };
    nvim-cmp-async-path = {
      url = "github:FelipeLema/cmp-async-path";
      flake = false;
    };
    nvim-cmp-cmdline = {
      url = "github:hrsh7th/cmp-cmdline";
      flake = false;
    };
    nvim-cmp-luasnip = {
      url = "github:saadparwaiz1/cmp_luasnip";
      flake = false;
    };
    nvim-cmp-git = {
      url = "github:petertriho/cmp-git";
      flake = false;
    };
    nvim-cmp-lsp-signature-help = {
      url = "github:hrsh7th/cmp-nvim-lsp-signature-help";
      flake = false;
    };
    nvim-cmp-ctags = {
      url = "github:delphinus/cmp-ctags";
      flake = false;
    };
    nvim-cmp-dap = {
      url = "github:rcarriga/cmp-dap";
      flake = false;
    };
    nvim-cmp-npm = {
      url = "github:David-Kunz/cmp-npm";
      flake = false;
    };
    nvim-noice = {
      url = "github:folke/noice.nvim";
      flake = false;
    };
    nvim-diffview = {
      url = "github:sindrets/diffview.nvim";
      flake = false;
    };
    nvim-obsidian = {
      url = "github:epwalsh/obsidian.nvim";
      flake = false;
    };
    nvim-friendly-snippets = {
      url = "github:rafamadriz/friendly-snippets";
      flake = false;
    };
    nvim-gitignore = {
      url = "github:wintermute-cell/gitignore.nvim";
      flake = false;
    };
    nvim-yuck = {
      url = "github:elkowar/yuck.vim";
      flake = false;
    };
    nvim-caser = {
      url = "github:arthurxavierx/vim-caser";
      flake = false;
    };
    nvim-auto-indent = {
      url = "github:VidocqH/auto-indent.nvim";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }:
  with import nixpkgs { system = "x86_64-linux"; };
  let
    plugins-inputs = lib.attrsets.filterAttrs
      (name: value: (builtins.match "^nvim-.+$" name) != null)
      inputs
    ;

    # Generate Neovim plugins from inputs
    plugins = lib.attrsets.mapAttrs
      (name: value: pkgs.vimUtils.buildVimPlugin {
        pname = name;
        version = "git-flake-input";
        src = value;
      })
      plugins-inputs
    ;
  in
  {
    homeManagerModules.default = import ./nix/hm-module.nix {
      inherit plugins;
      overlays = self.overlays.default;
      package = self.packages.x86_64-linux.default;
    };
    overlays.default = [
      inputs.haskell-tools-nvim.overlays.default
      inputs.haskell-snippets.overlays.default
      inputs.rustaceanvim.overlays.default
      (final: prev: import ./nix/overlay.nix { inherit final prev; })
      inputs.nil.overlays.default
    ];
    packages.x86_64-linux.default =
      pkgs.callPackage ./nix {}
    ;
  };
}

