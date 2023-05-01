-- ---------
-- ---Coq---
-- ---------

vim.g.coq_settings = {
  xdg = true,
}
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserCoqAttach', {}),
  callback = function(ev)
    require('coq')
    vim.cmd([[:COQnow --shut-up]])
  end
})
