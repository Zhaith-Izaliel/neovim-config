local colors = require("galaxyline.themes.colors").catppuccin
local M = {}

-- powerline_extra:                                         
-- font_awesome:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
-- devicons:                                                                                                                                                                                                      


function ViModeColor(mode)
  local mode_color = {
    n = colors.green,
    i = colors.blue,
    v = colors.magenta,
    [''] = colors.blue,
    V = colors.blue,
    c = colors.red,
    no = colors.magenta,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.magenta,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!']  = colors.green,
    t = colors.green,
    Rv = colors.magenta,
    default = colors.fg_alt,
  }
  return mode_color[mode] == nil and mode_color['default'] or mode_color[mode]
end

function M.PaddingViMode()
  vim.api.nvim_command('hi GalaxyPaddingViMode guibg='..ViModeColor(vim.fn.mode()))
  return ' '
end

function M.ViMode()
  -- auto change color() according the vim mode
  local alias = {
    n = 'NORMAL',
    i = 'INSERT',
    c= 'COMMAND',
    V= 'VISUAL',
    [''] = 'VISUAL',
    v ='VISUAL',
    ['r?'] = ':CONFIRM',
    rm = '--MORE',
    R  = 'REPLACE',
    Rv = 'VIRTUAL',
    s  = 'SELECT',
    S  = 'SELECT',
    ['r']  = 'HIT-ENTER',
    [''] = 'SELECT',
    t  = 'TERMINAL',
    ['!']  = 'SHELL',
    default = 'UNKNOWN',
  }

  local vim_mode = vim.fn.mode()
  local string = alias[vim_mode] == nil and alias['default'] or alias[vim_mode]
  vim.api.nvim_command('hi GalaxyViMode gui=BOLD guibg='..ViModeColor(vim_mode)..' guifg='..colors.bg)
  return string..' '
end

function M.FileReadOnly(readonly_icon)
  if vim.bo.filetype == 'help' then
    return ''
  end
  local icon = readonly_icon or ''
  if vim.bo.readonly == true then
    return " " .. icon .. " "
  end
  return ''
end

return M
