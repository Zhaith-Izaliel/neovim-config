-- ---------
-- ---Coq---
-- ---------

vim.g.coq_settings = {
  xdg = true,
}

require('coq')
vim.cmd([[:COQnow --shut-up]])
