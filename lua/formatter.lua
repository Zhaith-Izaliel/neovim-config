-- ---------------
-- ---Formatter---
-- ---------------
require("conform").setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    json = { "jq" },
    markdown = { "mdformat" },
    bash = { "shellcheck" },
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
