{ pkgs, stdenv }:

let
  nodejs-servers = (import ./nodejs {
    inherit pkgs stdenv;
    nodejs = pkgs.nodejs;
  });
in
with pkgs; [
  nil
  nodePackages.pyright
  sumneko-lua-language-server
  rust-analyzer
  nodePackages.vscode-langservers-extracted # CSS, HTML, JSON, ESLint
  nodePackages.typescript
  nodePackages.eslint
  haskell-language-server
  nodePackages.vls
  ccls
  gopls
  cmake-language-server
  omnisharp-roslyn
  ltex-ls
  nodePackages.markdownlint-cli
  nodejs-servers.stylelint-lsp
  commitlint
]

