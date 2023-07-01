{ pkgs, stdenv }:

let
  nodejs-servers = (import ./nodejs {
    inherit pkgs stdenv;
    nodejs = pkgs.nodejs;
  });
  commitlint-override = nodejs-servers."@commitlint/cli".overrideAttrs (final:
  prev: {
    buildInputs = [ nodejs-servers.commitlint-format-json ] + prev.buildInputs;
    installPhase = prev.installPhase + ''

      mkdir -p $out/node_modules
      ln -s ${nodejs-servers.commitlint-format-json}/lib/node_modules/* $out/node_modules
    '';
  });
in
{
  packages = with pkgs; [
    nil
    nodePackages.pyright
    sumneko-lua-language-server
    rust-analyzer
    nodePackages.vscode-langservers-extracted # CSS, HTML, JSON, ESLint
    nodePackages.typescript-language-server
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
    commitlint-override
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

