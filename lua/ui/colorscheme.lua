-- -----------------
-- ---Color Theme---
-- -----------------

-- Icon theme
require('nvim-web-devicons').setup()

-- Catppuccin theme
-- colors
local macchiato = require("catppuccin.palettes").get_palette "macchiato"

require('catppuccin').setup({
  flavour = 'macchiato',
  transparent_background = true,
  background = {
    light = 'latte',
    dark = 'macchiato',
  },
  no_italic = true,
  integrations = {
    treesitter = true,
    alpha = true,
    treesitter_context = true,
    neotest = true,
    gitsigns = true,
    aerial = true,
    ufo = true,
    cmp = true,
    mini = {
      enabled = true,
      indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
    },
    which_key = true,
    flash = true,
    notify = true,
    illuminate = true,
    telescope = {
      enabled = true,
    },
    native_lsp = {
      enabled = true,
    },
    dap = {
      enabled = true,
      enable_ui = true, -- enable nvim-dap-ui
    },
    lsp_trouble = true,
    noice = true,
  },
  custom_highlights = {
    StatusLine = { fg = macchiato.text, bg = macchiato.crust },
    ['@text.todo'] = { bg = 'none' }, -- remove TODO highlight
    -- Normal = { bg = 'none' },
  },
})


-- Dap And Dap UI Override for Catppuccin
-- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
require("dap")

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "◉", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

-- Apply Theme
vim.cmd.colorscheme('catppuccin')
