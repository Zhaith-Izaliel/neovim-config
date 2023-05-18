-- ---------------------
-- ---Custom Commands---
-- ---------------------

-- Swap folder
vim.cmd("command! ListSwap split | enew | r !ls -l " .. NVIM_TMP_DIRECTORY)
vim.cmd("command! CleanSwap !rm -rf " .. NVIM_TMP_DIRECTORY .. "/*.swp")

-- Open help tags
vim.cmd("command! HelpTags Telescope help_tags")

-- Create ctags
vim.cmd('command! MakeCTags !ctags -R --exclude=@.ctagsignore .')
