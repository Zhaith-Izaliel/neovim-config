require('mini.trailspace').setup {}
require('mini.surround').setup {}
require('mini.pairs').setup {}
require('mini.move').setup {
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<S-h>',
    right = '<S-l>',
    down = '<S-j>',
    up = '<S-k>',

    -- Move current line in Normal mode
    line_left = '<M-h>',
    line_right = '<M-l>',
    line_down = '<M-j>',
    line_up = '<M-k>',
  },
}

require('mini.indentscope').setup {
  symbol = '▏',
}
require('mini.splitjoin').setup {}
require('mini.ai').setup {}

