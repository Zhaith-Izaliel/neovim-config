-- Hardtime
require('hardtime').setup {
  allow_different_key = true,
  enabled = true;
  restricted_keys = {
    -- ['<UP>'] = { 'n', 'x' },
    -- ['<DOWN>'] = { 'n', 'x' },
    -- ['<LEFT>'] = { 'n', 'x' },
    -- ['<RIGHT>'] = {'n', 'x' },
    ['<UP>'] = {},
    ['<DOWN>'] = {},
    ['<LEFT>'] = {},
    ['<RIGHT>'] = {},
    ['+'] = {},
    ['-'] = {},
    ['g<UP>'] = { 'n', 'x' },
    ['g<DOWN>'] = { 'n', 'x' },
  },
  disabled_keys = {
    ['<UP>'] = {},
    ['<DOWN>'] = {},
    ['<LEFT>'] = {},
    ['<RIGHT>'] = {},
  },
}

