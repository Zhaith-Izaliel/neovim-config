{ pkgs, stdenv }:

let
  nodejs-servers = (import ./nodejs {
    inherit pkgs stdenv;
    nodejs = pkgs.nodejs;
  });
  nodeDependencies = (pkgs.callPackage ./nodejs/composition.nix {}).commitlint-format-json.nodeDependencies;
  overriden-commitlint = nodejs-servers."@commitlint/cli".overrideAttrs(final: prev: {
    buildPhase = ''
      ln -s ${nodeDependencies}/lib/node_modules ./node_modules
      export PATH="${nodeDependencies}/bin:$PATH"

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
  nodejs-servers."@commitlint/config-conventional"
  nodejs-servers.commitlint-format-json
  overriden-commitlint
]

