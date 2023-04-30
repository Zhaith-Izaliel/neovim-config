-- -----------------
-- ---Color Theme---
-- -----------------

-- Icon theme
require('nvim-web-devicons').setup()

-- Catppuccin theme
require('catppuccin').setup({
  flavour = 'macchiato',
  background = {
    light = 'latte',
    dark = 'macchiato',
  },
  no_italic = true,
  integrations = {
    treesitter = true,
    treesitter_context = true,
    neotree = true,
    neotest = true,
    gitsigns = true,
    which_key = true,
    pounce = true,
    overseer = true,
    illuminate = true,
    native_lsp = {
      enabled = true,
    },
    dap = {
        enabled = true,
        enable_ui = true, -- enable nvim-dap-ui
    },
  },
})

-- Dap And Dap UI Override for Catppuccin
-- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
require("dap")

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

-- Apply Theme
vim.cmd.colorscheme('catppuccin')
