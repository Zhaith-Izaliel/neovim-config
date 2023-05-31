require('mini.trailspace').setup {}
require('mini.surround').setup {}
require('mini.pairs').setup {}
require('mini.move').setup {
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<S-Left>',
    right = '<S-Right>',
    down = '<S-Down>',
    up = '<S-Up>',

    -- Move current line in Normal mode
    line_left = '<M-Left>',
    line_right = '<M-Right>',
    line_down = '<M-Down>',
    line_up = '<M-Up>',
  },
}

require('mini.indentscope').setup {}
require('mini.splitjoin').setup {}

