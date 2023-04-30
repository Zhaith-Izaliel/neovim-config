-- -----------------
-- ---Galaxy Line---
-- -----------------

require('statusline.line-theme').setup()
local gl = require('galaxyline')
local gls = gl.section
local colors = require('galaxyline.themes.colors').catppuccin
local condition = require('galaxyline.condition')

-- Custom Providers
local custom_providers = require('statusline.custom-providers')

-- Applying Sections
gls.left = {
  {
    PaddingViMode = {
      provider = custom_providers.PaddingViMode,
    }
  },
  {
    ViMode = {
      provider = custom_providers.ViMode,
      separator = ' ',
      separator_highlight = { colors.fg, colors.bg },
    }
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = condition.buffer_not_empty,
      highlight = { colors.fg_alt, colors.bg, 'BOLD' },
    }
  },
  {
    FileName = {
      provider = 'FileName',
      condition = condition.buffer_not_empty,
      separator =  ' ',
      separator_highlight = { colors.bg, colors.bg_alt },
      highlight = { colors.blue, colors.bg }
    }
  },
  {
    GitBranch = {
      provider = 'GitBranch',
      icon = ' ',
      condition = condition.check_git_workspace,
      separator = ' ',
      separator_highlight = { colors.fg_alt, colors.bg_alt },
      highlight = { colors.magenta, colors.bg_alt, 'BOLD' }
    }
  },
  {
    BranchSeparator = {
      provider = function()
        local vcs = require("galaxyline.providers.vcs")
        local boolean = vcs.diff_add()
          or vcs.diff_remove()
          or vcs.diff_modified()
        return custom_providers.ConditionalSeparator(boolean, ' ')
      end,
      condition = condition.check_git_workspace,
      highlight = { colors.fg, colors.bg_alt, }
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      icon = ' ',
      condition = condition.check_git_workspace,
      highlight = { colors.green, colors.bg_alt, 'BOLD' },
    }
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      icon = ' ',
      condition = condition.check_git_workspace,
      highlight = { colors.red, colors.bg_alt, 'BOLD' },
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      icon = ' ',
      separator =  ' ',
      separator_highlight = { colors.bg_alt, colors.bg },
      condition = condition.check_git_workspace,
      highlight = { colors.blue, colors.bg_alt, 'BOLD' },
    }
  },
}

gls.mid = {
  {
    FirstSeparator = {
      provider = function() return ' ' end,
      highlight = { colors.bg, colors.bg_alt }
    }
  },
  {
    LspIconBold = {
      provider = function() return ' ' end,
      highlight = { colors.orange, colors.bg_alt, 'BOLD' },
    },
  },
  {
    LspClient = {
      provider = 'GetLspClient',
      highlight = { colors.orange, colors.bg_alt },
    }
  },
  {
    DiagnosticSeparator = {
      provider = function()
        local diagnostic = require("galaxyline.providers.diagnostic")
        local boolean = diagnostic.get_diagnostic_error() ~= ""
          or diagnostic.get_diagnostic_warn() ~= ""
          or diagnostic.get_diagnostic_hint() ~= ""
          or diagnostic.get_diagnostic_info() ~= ""
        return custom_providers.ConditionalSeparator(boolean, '   ')
      end,
      highlight = { colors.fg, colors.bg_alt, }
    }
  },
  {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = ' ',
      highlight = { colors.red, colors.bg_alt, 'BOLD' },
    }
  },
  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = ' ',
      highlight = { colors.orange, colors.bg_alt, 'BOLD' },
    }
  },
  {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = ' ',
      highlight = { colors.green, colors.bg_alt, 'BOLD' },
    }
  },
  {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = ' ',
      separator =  ' ',
      separator_highlight = { colors.bg_alt, colors.bg },
      highlight = { colors.fg_alt, colors.bg_alt, 'BOLD' },
    }
  },
  {
    LastSeparator = {
      provider = function() return ' ' end,
      highlight = { colors.bg_alt, colors.bg }
    }
  },

}

gls.right = {
  {
    FileEncode = {
      provider = 'FileEncode',
      condition = condition.buffer_not_empty,
      separator =  '',
      separator_highlight = { colors.bg, colors.bg_alt },
      highlight = { colors.green, colors.bg_alt }
    }
  },
  {
    FileFormat = {
      provider = 'FileFormat',
      condition = condition.buffer_not_empty,
      separator =  ' ',
      separator_highlight = { colors.fg, colors.bg_alt },
      highlight = { colors.green, colors.bg_alt }
    }
  },
  {
    Whitespace = {
      provider = function() return ' ' end,
      condition = condition.buffer_not_empty,
      highlight = { colors.fg, colors.bg_alt },
    }
  },
  {
    LineColumn = {
      provider = 'LineColumn',
      condition = condition.buffer_not_empty,
      separator =  ' ',
      separator_highlight = { colors.bg_alt, colors.bg },
      highlight = { colors.fg_alt, colors.bg }
    }
  },
  {
    LinePercent = {
      provider = 'LinePercent',
      condition = condition.buffer_not_empty,
      separator =  '',
      separator_highlight = { colors.fg, colors.bg },
      highlight = { colors.fg_alt, colors.bg }
    }
  },
  {
    ScrollBar = {
      provider = 'ScrollBar',
      condition = condition.buffer_not_empty,
      highlight = { colors.cyan, colors.bg_alt }
    }
  },
}
