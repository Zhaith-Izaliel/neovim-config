-- -------------
-- ---Plugins---
-- -------------

-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local noremap = Utils.noremap
local exprmap = Utils.exprmap
local nnoremap = Utils.nnoremap
-- local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
-- local inoremap = Utils.inoremap
-- local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local imap = Utils.imap
-- local xmap = Utils.xmap

-- Pounce
nnoremap('s', function() require('pounce').pounce {} end, 'Pounce: Search.')
nnoremap('s', function() require('pounce').pounce { do_repeat = true } end,
  'Pounce: Search with repeat.')
noremap('x', 's', function() require('pounce').pounce {} end,
  'Pounce: Search.')
noremap('o', 'gs', function() require('pounce').pounce {} end,
  'Pounce: Search.')
nnoremap('S', function() require('pounce').pounce { input = { reg = "/" } } end
  , 'Pounce: Search with regex.')


-- Neogen
require('neogen').setup({ snippet_engine = 'luasnip' })
nnoremap('<Leader>ng', require('neogen').generate,
  'Neogen: Generate annotation for the block under the cursor.')

-- Vim Kitty Navigator
vim.g.kitty_navigator_no_mappings = 1

noremap({ 'n', 'i', 'v' }, '<C-Space><Left>', '<Cmd>KittyNavigateLeft<CR>',
  'Kitty Navigator: Navigate left between splits.')
noremap({ 'n', 'i', 'v' }, '<C-Space><Down>', '<Cmd>KittyNavigateDown<CR>',
  'Kitty Navigator: Navigate down between splits.')
noremap({ 'n', 'i', 'v' }, '<C-Space><Up>', '<Cmd>KittyNavigateUp<CR>',
  'Kitty Navigator: Navigate up between splits.')
noremap({ 'n', 'i', 'v' }, '<C-Space><Right>', '<Cmd>KittyNavigateRight<CR>',
  'Kitty Navigator: Navigate right between splits.')

-- Git signs
require('gitsigns').setup {
  current_line_blame = true,
}

-- Colorizer
local colorizer_options_css = {
  css = true,
  css_fn = true,
  tailwind = true,
  sass = { enable = true, parsers = { 'css' }, },
  mode = 'foreground'
}

require('colorizer').setup {
  filetypes = {
    '*',
    css = colorizer_options_css,
    sass = colorizer_options_css,
    less = colorizer_options_css,
    html = colorizer_options_css,
    vue = colorizer_options_css,
  },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    AARRGGBB = true, -- 0xAARRGGBB hex codes
    names = false,
    css = false,
    css_fn = false,
    tailwind = false,
    sass = { enable = false, },
    mode = 'foreground',
  },
}

nnoremap('<Leader>nc', ':ColorizerToggle<CR>', 'Colorizer: Toggle on/off.')

-- Todo-Comments
local todoCommentsConfig = {
  -- keywords recognized as todo comments
  keywords = {
    BOOTSTRAP = { icon = '', color = '#b1acae', },
    BUG       = { icon = '', color = '#aa003e', },
    DEBUG     = { icon = '', color = '#80af71', alt = { 'DEBUGGING' } },
    DEPR      = { icon = '', color = '#a64ca6', alt = { 'DEPRECATED' } },
    FIX       = { icon = '', color = '#ffd700', alt = { 'FIXME', 'FIXIT' } },
    HACK      = { icon = '', color = '#ff8c00', },
    IMPT      = { icon = '', color = '#f08080', alt = { 'IMPORTANT' } },
    NOTE      = { icon = '', color = '#e04a9a', alt = { 'INFO' } },
    PERF      = { icon = '', color = '#997a8e', alt = { 'OPTIM',
      'PERFORMANCE', 'OPTIMIZE' } },
    QUERY     = { icon = '', color = '#6495ed', alt = { 'QRY' } },
    TEMP      = { icon = '', color = '#b0c4de', alt = { 'TEMPORARY',
      'TMP' } },
    TEST      = { icon = '', color = '#a580ec', alt = { 'TESTING' } },
    PASSED    = { icon = '', color = '#5ac88b', },
    FAILED    = { icon = '', color = '#dd0051', },
    TODO      = { icon = '', color = '#3cb371', },
  },
  gui_style = {
    fg = 'NONE',
    bg = 'BOLD',
  },
  highlight = {
    comments_only = true, -- uses treesitter to match keywords in comments only
  },
}

require('todo-comments').setup(todoCommentsConfig)
-- HACK: Set todo signs to be bold
for kw, opts in pairs(todoCommentsConfig.keywords) do
  vim.cmd('hi TodoSign' .. kw .. ' guifg=' .. opts.color .. ' gui=bold')
end

-- Comment
require('Comment').setup {
  mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}`
    ---`gb[count]{motion}`
    basic = true,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = false,
  },
}

-- Which Key
require('which-key').setup()

-- Neoclip
require('telescope').load_extension('neoclip')
require('neoclip').setup {
  enable_persistent_history = true,
  continuous_sync = true,
}
nnoremap('<Leader>p', '<cmd>Telescope neoclip<CR>',
  'Neoclip: Show yanking history')

-- LuaSnip
local luasnip = require('luasnip')
exprmap('i', '<Tab>',
  function()
    if luasnip.expand_or_jumpable() then
      return luasnip.expand_or_jump()
    end
    return '<Tab>'
  end,
  'LuaSnip: Expand snippet or jump to next tabstop.')

noremap({ 'i', 's' }, '<S-Tab>', function() luasnip.jump(-1) end,
  'LuaSnip: Jump to previous tabstop.')

noremap('s', '<Tab>', function() luasnip.jump(1) end,
  'LuaSnip: Jump to next tabstop.')

exprmap({ 'i', 's' }, '<C-E>',
  function()
    if luasnip.choice_active() then
      return luasnip.next_choice()
    end
    return '<C-E>'
  end,
  'LuaSnip: Change choices in choiceNodes.')

-- Surround
require('nvim-surround').setup()

-- Nabla
nnoremap('<Leader>np', function() require('nabla').popup() end,
  'Nabla: show popup')

-- Crates
require('crates').setup {
  src = {
    coq = {
      enabled = true,
      name = "crates.nvim",
    },
  },
}

