{ pkgs, lib }:

let
  customPlugins = lib.attrsets.mapAttrsToList
  (key: value: value)
  (import ./custom.nix { inherit pkgs lib; });
in
with pkgs.vimPlugins; [
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
  smart-splits-nvim
  gitsigns-nvim
  nvim-colorizer-lua
  vim-nix
  todo-comments-nvim
  comment-nvim
  luasnip
  nvim-web-devicons
  plenary-nvim
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
  null-ls-nvim
  haskell-tools-nvim
  # Telescope
  telescope-nvim
  telescope-symbols-nvim
  telescope-project-nvim
  telescope-zoxide
  popup-nvim
] ++ customPlugins

