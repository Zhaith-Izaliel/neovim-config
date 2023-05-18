-- -------------------
-- ---Auto Commands---
-- -------------------

-- Palette
local augroups = {
  UserOnSave = vim.api.nvim_create_augroup('UserOnSave', {}),
}

-- Add new line to the end of the file
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  group = augroups.UserOnSave,
  pattern = '*',
  callback = function()
    local n_lines = vim.api.nvim_buf_line_count(0)
    local last_nonblank = vim.fn.prevnonblank(n_lines)
    if last_nonblank <= n_lines then vim.api.nvim_buf_set_lines(0,
      last_nonblank, n_lines, true, { '' })
    end
  end,
})

