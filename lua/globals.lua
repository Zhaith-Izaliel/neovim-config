-- ----------------------
-- ---Global Variables---
-- ----------------------
Nvim_tmp_directory = os.getenv('HOME') .. '/.config/nvim/tmp'
if (vim.fn.empty(vim.fn.glob(Nvim_tmp_directory))) then
  vim.cmd([[silent !mkdir -p ]] .. Nvim_tmp_directory)
end

Notes_directory = os.getenv('HOME') .. '/Notes'
