-- -----------------
-- ---Galaxy Line---
-- -----------------
local catppuccin_colors = require('catppuccin.palettes').get_palette()
local present, galaxyline_colors = pcall(require, 'galaxyline.themes.colors')
if not present then
  return
end
galaxyline_colors.catppuccin = {
  bg = catppuccin_colors.crust,
  fg = catppuccin_colors.text,
  fg_alt = catppuccin_colors.subtext0,
  yellow = catppuccin_colors.yellow,
  cyan = catppuccin_colors.sky,
  green = catppuccin_colors.green,
  orange = catppuccin_colors.peach,
  magenta = catppuccin_colors.mauve,
  blue = catppuccin_colors.blue,
  red = catppuccin_colors.red,
}

local colors = require("galaxyline.themes.colors").catppuccin 
require('galaxyline').section.left[1] = {
  FileSize = {
    provider = 'FileSize',
    condition = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    icon = '   ',
    highlight = { colors.green, colors.bg },
    separator = '',
    separator_highlight = { colors.magenta, colors.bg },
  }
}
