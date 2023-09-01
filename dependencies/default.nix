{ pkgs, stdenv }:

let
  nodejs-servers = (import ../packages/nodejs {
    inherit pkgs stdenv;
    nodejs = pkgs.nodejs;
  });
in
{
  packages = with pkgs; [
    # LSP Servers
    nil
    nodePackages.pyright
    sumneko-lua-language-server
    rust-analyzer
    nodePackages.vscode-langservers-extracted # CSS, HTML, JSON, ESLint
    nodePackages.typescript-language-server
    nodePackages.eslint
    nodePackages.markdownlint-cli
    haskell-language-server
    nodePackages.vls
    ccls
    gopls
    cmake-language-server
    omnisharp-roslyn
    ltex-ls
    nodejs-servers.stylelint-lsp
    nodejs-servers."@tailwindcss/language-server"
    nodejs-servers."@volar/vue-language-server"

    # Dependencies
    graphviz
    universal-ctags
    watchman
    python310Packages.virtualenv
    ripgrep
    dotnet-sdk
    viu
    xclip
  ];
}

