local M = {}

function M.ViMode(colors)
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
  }
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
    R = colors.purple,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!']  = colors.green,
    t = colors.green,
    Rv = colors.magenta,
  }
  local vim_mode = vim.fn.mode()
  vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim_mode])
  return alias[vim_mode] .. '   '
end

return M
