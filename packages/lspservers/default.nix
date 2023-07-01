{ pkgs, stdenv }:

let
  nodejs-servers = (import ./nodejs {
    inherit pkgs stdenv;
    nodejs = pkgs.nodejs;
  });
  commitlint-override = nodejs-servers."@commitlint/cli".overrideAttrs (final:
  prev: {
    nativeBuildInputs = [
      nodejs-servers."@commitlint/config-conventional"
      nodejs-servers.commitlint-format-json
    ];
    installPhase = prev.installPhase + ''

    ln -s ${nodejs-servers.commitlint-format-json}/lib/node_modules $out/node_modules
    ln -s ${nodejs-servers."@commitlint/config-conventional"}/lib/node_modules $out/node_modules
    '';
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

