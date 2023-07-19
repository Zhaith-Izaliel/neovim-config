-- Hardtime
require('hardtime').setup {
  restricted_keys = {
    ['<UP>'] = { 'n', 'v' },
    ['<DOWN>'] = { 'n', 'v' },
    ['<LEFT>'] = { 'n', 'v' },
    ['<RIGHT>'] = { 'n', 'v' },
    ['+'] = { 'n', 'v' },
    ['g<UP>'] = { 'n', 'v' },
    ['g<DOWN>'] = { 'n', 'v' },
    ['<CR>'] = { 'n', 'v' },
    ['<C-M>'] = { 'n', 'v' },
    ['<C-N>'] = { 'n', 'v' },
    ['<C-P>'] = { 'n', 'v' },
  },
  disabled_keys = {
    ['<UP>'] = {""},
    ['<DOWN>'] = {""},
    ['<LEFT>'] = {""},
    ['<RIGHT>'] = {""},
  },
}

