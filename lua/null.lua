local null_ls = require('null-ls')
local cspell = require('cspell')

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.eslint,
    null_ls.builtins.diagnostics.commitlint,
    cspell.diagnostics,
    cspell.code_actions,
  }
}

