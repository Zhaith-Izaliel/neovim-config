vim.opt_local.isfname:append({ "@-@" })
vim.opt_local.includeexpr = vim.fn.substitute(vim.v.fname, [[^@\/]], 'src/', '')
