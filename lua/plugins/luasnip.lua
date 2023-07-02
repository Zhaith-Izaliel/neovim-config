-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local noremap = Utils.noremap
local exprmap = Utils.exprmap

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

