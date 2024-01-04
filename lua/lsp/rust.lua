local Utils = require('utils')

local nnoremap = Utils.nnoremap

nnoremap(
  '<leader>a',
  function() vim.cmd.RustLsp('codeAction') end,
  'Rustacean: Code Action',
  { buffer = vim.api.nvim_get_current_buf() }
)

