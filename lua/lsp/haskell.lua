local Utils = require('utils')

local nnoremap = Utils.nnoremap

local ht = require('haskell-tools')

ht.setup {
  log = {
    level = vim.log.levels.OFF,
  },
}

ht.start_or_attach {
  hls = {
    on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, }
      -- haskell-language-server relies heavily on codeLenses,
      -- so auto-refresh (see advanced configuration) is enabled by default
      nnoremap('<space>ca', vim.lsp.codelens.run, 'Haskell-Tools: codelens', opts)
      nnoremap('<space>hs', ht.hoogle.hoogle_signature, 'Haskell-Tools: Get Hoogle signature', opts)
      nnoremap('<space>ea', ht.lsp.buf_eval_all, 'Haskell-Tools: Eval entire buffer', opts)
    end,
  },
}

-- Suggested keymaps that do not depend on haskell-language-server:
local bufnr = vim.api.nvim_get_current_buf()
-- set buffer = bufnr in ftplugin/haskell.lua
local opts = { buffer = bufnr }

-- Toggle a GHCi repl for the current package
nnoremap('<leader>rr', ht.repl.toggle, 'Haskell-Tools: Toggle GHCi repl for the current package', opts)
-- Toggle a GHCi repl for the current buffer
nnoremap('<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, 'Haskell-Tools: Toggle GHCi repl for the current buffer')
nnoremap('<leader>rq', ht.repl.quit, 'Haskell-Tools: Quit repl', opts)

