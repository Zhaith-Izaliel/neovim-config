-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local noremap = Utils.noremap

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

