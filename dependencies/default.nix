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
    # rust-analyzer
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

  files = {
    commitlintrc = ''
    module.exports = {
      extends:
      [
        '${nodejs-servers."@commitlint/config-conventional"}/lib/node_modules/@commitlint/config-conventional'
      ],
      formatter: '@commitlint/format',
      parserPreset: undefined,
      ignores: undefined,
      defaultIgnores: undefined,
      plugins: [],
      rules: {},
      helpUrl: 'https://github.com/conventional-changelog/commitlint/#what-is-commitlint',
      prompt: {}
    }
    '';
  };
}

