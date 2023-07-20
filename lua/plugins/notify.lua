-- Overriding vim.notify with fancy notify if fancy notify exists
local notify = require("notify")
local Utils = require('utils')
local noremap = Utils.noremap;

vim.notify = notify

local last_print = ''

print = function(...)
  local print_safe_args = {}
  local _ = { ... }

  for i = 1, #_ do
    table.insert(print_safe_args, tostring(_[i]))
  end
  local current_print = table.concat(print_safe_args, ' ');

  if last_print == current_print then
    return
  end

  notify(current_print, "info")
  last_print = current_print
end

notify.setup {
  render = "compact",
}

noremap(
  '',
  '<Esc>',
  "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>",
  "Clear notifications."
)

