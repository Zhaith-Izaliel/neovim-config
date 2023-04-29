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
vim.o.cmdheight = 0

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
local nvim_tmp_directory = os.getenv( 'HOME' ) .. '/.config/nvim/tmp'
if (vim.fn.empty(vim.fn.glob(nvim_tmp_directory))) then
  vim.cmd([[silent !mkdir -p ]] .. nvim_tmp_directory)
end
vim.o.directory = nvim_tmp_directory

-- Disable inline error messages
vim.diagnostic.config {
  virtual_text = false,
  underline = false,
  signs = true,          -- Keep gutter signs
}
