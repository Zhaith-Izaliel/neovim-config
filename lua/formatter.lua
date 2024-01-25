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
    javascript = { { 'eslint_d', 'prettierd', 'prettier' } },
    typescript = { { 'eslint_d', 'prettierd', 'prettier' } },
    vue = { { 'eslint_d', 'prettierd', 'prettier' } },
    markdown = { 'mdformat' },
    bash = { 'shellcheck' },
  },
})

require('conform.formatters.eslint_d').cwd = require('conform.util').root_file({
  '.eslint.js',
  '.eslint.cjs',
  '.eslint.yaml',
  '.eslint.yml',
  '.eslint.json',
})
require('conform.formatters.eslint_d').require_cwd = true

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
