-- -------------
-- ---Plugins---
-- -------------

require('plugins.colorizer')
require('plugins.comments')
require('plugins.gitsign')
require('plugins.kitty')
require('plugins.neogen')
require('plugins.pounce')
require('plugins.todo')
require('plugins.which-key')

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
nnoremap('<Leader>el', function() require('nabla').popup() end,
  'Nabla: show popup')

-- Regexplainer
nnoremap('<Leader>er', function() require('regexplainer').show() end,
  'Regexplainer: show popup')

-- Crates
require('crates').setup {
  src = {
    coq = {
      enabled = true,
      name = 'crates.nvim',
    },
  },
}

-- Hardtime
require('hardtime').setup {
  restricted_keys = {
    ['<UP>'] = { 'n', 'v' },
    ['<DOWN>'] = { 'n', 'v' },
    ['<LEFT>'] = { 'n', 'v' },
    ['<RIGHT>'] = { 'n', 'v' },
    ['-'] = { 'n', 'v' },
    ['+'] = { 'n', 'v' },
    ['g<UP>'] = { 'n', 'v' },
    ['g<DOWN>'] = { 'n', 'v' },
    ['<CR>'] = { 'n', 'v' },
    ['<C-M>'] = { 'n', 'v' },
    ['<C-N>'] = { 'n', 'v' },
    ['<C-P>'] = { 'n', 'v' },
  },
  disabled_keys = {}
}

