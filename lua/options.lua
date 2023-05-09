-- ----------------------------------
-- ---Native Configuration Options---
-- ----------------------------------

-- Gui
vim.o.termguicolors = true
vim.o.number = true
vim.o.numberwidth = 3
vim.o.history = 100
vim.o.ruler = true
vim.o.showmode = false
vim.o.signcolumn='auto:2'
if (vim.fn.exists('+colorcolumn')) then
  vim.o.colorcolumn = '80'
  vim.cmd.highlight({'ColorColumn', 'ctermbg=9'})
end
vim.o.cmdheight = 1
vim.o.conceallevel = 1

-- Indentation
vim.o.ai = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.smarttab = true

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Spell
vim.o.spell = true
vim.o.spelllang = 'en,fr'

-- Swap files
vim.o.directory = Nvim_tmp_directory

vim.diagnostic.config {
  virtual_text = true,
  underline = true,
  signs = true,          -- Keep gutter signs
}
