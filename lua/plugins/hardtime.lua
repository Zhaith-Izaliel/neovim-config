-- Hardtime
require('hardtime').setup {
  allow_different_key = true,
  enabled = true;
  restricted_keys = {
    ['<UP>'] = { 'n', 'x' },
    ['<DOWN>'] = { 'n', 'x' },
    ['<LEFT>'] = { 'n', 'x' },
    ['<RIGHT>'] = {'n', 'x' },
    ['+'] = {},
    ['-'] = {},
    ['g<UP>'] = { 'n', 'x' },
    ['g<DOWN>'] = { 'n', 'x' },
    ['<CR>'] = { 'n', 'x' },
    ['<C-M>'] = { 'n', 'x' },
    ['<C-N>'] = { 'n', 'x' },
    ['<C-P>'] = { 'n', 'x' },
  },
  disabled_keys = {
    ['<UP>'] = { 'i' },
    ['<DOWN>'] = { 'i' },
    ['<LEFT>'] = { 'i' },
    ['<RIGHT>'] = { 'i' },
  },
}

