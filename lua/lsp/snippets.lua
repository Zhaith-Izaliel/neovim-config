local ls = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

ls.add_snippets('haskell', require('haskell-snippets').all, { key = 'haskell' })

