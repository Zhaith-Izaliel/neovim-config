-- -----------------
-- ---Galaxy Line---
-- -----------------

require('line-theme')
local gl = require('galaxyline')
local gls = gl.section
local custom_providers = require('custom-providers')

local colors = require("galaxyline.themes.colors").catppuccin 


local right_section = {
  {

  },
}
local mid_section = {
  {

  },
}

-- Applying sections
gls.left[1] = {
  ViMode = {
    provider = custom_providers.ViMode(colors),
    highlight = { colors.fg, colors.bg },
  }
}
