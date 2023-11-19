-- ---------------
-- ---Formatter---
-- ---------------
require("conform").setup({
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

