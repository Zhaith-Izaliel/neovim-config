-- ---------------------
-- ---Custom Commands---
-- ---------------------

-- Swap folder
vim.cmd("command! ListSwap split | enew | r !ls -l " .. Nvim_tmp_directory)
vim.cmd("command! CleanSwap !rm -rf " .. Nvim_tmp_directory)

-- Open help tags
vim.cmd("command! HelpTags Telescope help_tags")

-- Create ctags
vim.cmd('command! MakeCTags !ctags -R --exclude=@.ctagsignore .')
