{ pkgs, stdenv }:

let
  nodejs-servers = (import ./nodejs {
    inherit pkgs stdenv;
    nodejs = pkgs.nodejs;
  });
  commitlint-override = nodejs-servers."@commitlint/cli".overrideAttrs (final:
  prev: {
    buildInputs = [ nodejs-servers.commitlint-format-json ] ++ prev.buildInputs;
    buildPhase = ''
    ln -s ${nodejs-servers.commitlint-format-json}/lib/node_modules ./node_modules

    '' + prev.buildPhase;
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
  commitlint-override
]

