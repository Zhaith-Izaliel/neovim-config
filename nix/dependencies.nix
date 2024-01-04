{ pkgs, stdenv }:

let
  nodejs-servers = (import ./nodejs {
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
    marksman
    nodePackages.bash-language-server
    haskell-language-server
    nodePackages.vls
    ccls
    gopls
    cmake-language-server
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

