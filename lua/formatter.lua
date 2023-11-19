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
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    vue = { { "prettierd", "prettier" } },
    json = { "jq" },
    markdown = { "markdownlint" },
    bash = { "shellcheck" },
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

