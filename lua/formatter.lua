-- ---------------
-- ---Formatter---
-- ---------------
require('conform').setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    json = { 'jq' },
    -- Use a sub-list to run only the first available formatter
    javascript = {},
    typescript = {},
    vue = {},
    markdown = { 'mdformat' },
    bash = { 'shellcheck' },
  },
})
