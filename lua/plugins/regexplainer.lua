-- Utils contains nvim-api keymap functions
local Utils = require('utils')

local nnoremap = Utils.nnoremap

-- Regexplainer
nnoremap('<Leader>er', function() require('regexplainer').show() end,
  'Regexplainer: show popup')

