-- Overriding vim.notify with fancy notify if fancy notify exists
local notify = require("notify")
local Utils = require('utils')
local noremap = Utils.noremap;

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
}

noremap(
  '',
  '<Esc>',
  "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>",
  "Clear notifications."
)

