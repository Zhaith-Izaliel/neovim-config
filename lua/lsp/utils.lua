local M = {}

local lsp_defaults = require('lspconfig').util.default_config

M.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

return M

