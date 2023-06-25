{ pkgs, stdenv }:

let
  nodejs-servers = (import ./nodejs {
    inherit pkgs stdenv;
    nodejs = pkgs.nodejs;
  });
  overriden-commitlint = nodejs-servers."@commitlint/cli".override({
    buildInputs = [
      nodejs-servers.commitlint-format-json
      nodejs-servers."@commitlint/config-conventional"
    ];
  });
in
with pkgs; [
  nil
  nodePackages.pyright
  sumneko-lua-language-server
  rust-analyzer
  nodePackages.vscode-langservers-extracted # CSS, HTML, JSON, ESLint
  nodePackages.typescript-language-server
  haskell-language-server
  nodePackages.vls
  ccls
  gopls
  cmake-language-server
  omnisharp-roslyn
  ltex-ls
  nodePackages.cspell
  nodePackages.markdownlint-cli
  nodejs-servers.stylelint-lsp
  overriden-commitlint
]

