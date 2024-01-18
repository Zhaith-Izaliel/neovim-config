vim.opt_local.isfname = vim.opt_local.isfname:get() .. "@-@"
vim.opt_local.includeexpr = [[substitute(v:fname,'^@\/','src/','')]]

