-- Hardtime
require('hardtime').setup {
  allow_different_key = true,
  enabled = true;
  restricted_keys = {
    ['<UP>'] = { 'n', 'x', 'i', 'v' },
    ['<DOWN>'] = { 'n', 'x', 'i', 'v' },
    ['<LEFT>'] = { 'n', 'x', 'i', 'v' },
    ['<RIGHT>'] = {'n', 'x', 'i', 'v' },
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

