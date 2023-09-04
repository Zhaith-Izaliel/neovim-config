-- Overriding vim.notify with fancy notify if fancy notify exists
local notify = require("notify")
local Utils = require('utils')
local noremap = Utils.noremap
local macchiato = require("catppuccin.palettes").get_palette "macchiato"

vim.notify = notify

-- print = function(...)
--   local print_safe_args = {}
--   local _ = { ... }
--   for i = 1, #_ do
--     table.insert(print_safe_args, tostring(_[i]))
--   end
--   notify(table.concat(print_safe_args, ' '), "info")
-- end

notify.setup {
  render = "compact",
  background_colour = macchiato.base,
}

noremap(
  '',
  '<Esc>',
  "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>",
  "Clear notifications."
)

