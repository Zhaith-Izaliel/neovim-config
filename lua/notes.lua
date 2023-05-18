-- -------------------------------------
-- ---Note taking based on Telekasten---
-- -------------------------------------

local Utils = require('utils')
local nnoremap = Utils.nnoremap;

local templates = NOTES_DIRECTORY .. '/Templates'
local template_daily = templates .. '/DailyNote.md'
local template_weekly = templates .. '/WeeklyNote.md'
local daily_dir = 'daily'
local weekly_dir = 'weekly'
local image_subdir = 'imgs'

require('telekasten').setup {
  home = NOTES_DIRECTORY .. '/Notes',
  templates = templates,
  template_new_daily = template_daily,
  template_new_weekly = template_weekly,
  image_subdir = image_subdir,
  dailies = daily_dir,
  weeklies = weekly_dir,
  media_previewer = 'viu-previewer',
  vaults = {
    work = {
      home = NOTES_DIRECTORY .. '/Work',
      image_subdir = image_subdir,
      dailies = daily_dir,
      weeklies = weekly_dir,
      templates = templates,
      template_new_daily = template_daily,
      template_new_weekly = template_weekly,
    },
    curriculum = {
      home = NOTES_DIRECTORY .. '/Curriculum',
      image_subdir = image_subdir,
      templates = templates,
      dailies_create_nonexisting = false,
      weeklies_create_nonexisting = false,

    },
    cheatsheets = {
      home = NOTES_DIRECTORY .. '/Cheatsheets',
      image_subdir = image_subdir,
      dailies_create_nonexisting = false,
      weeklies_create_nonexisting = false,
      templates = templates,
    },
  },

}

-- Launch panel if nothing is typed after <leader>t
nnoremap('<leader>tp', '<cmd>Telekasten panel<CR>', 'Telekasten: Open panel.')

-- Most used functions
nnoremap('<leader>tv', '<cmd>Telekasten switch_vault<CR>', 'Telekasten: Switch vault.')
nnoremap('<leader>tf', '<cmd>Telekasten find_notes<CR>', 'Telekasten: Find notes.')
nnoremap('<leader>tg', '<cmd>Telekasten search_notes<CR>', 'Telekasten: Search notes.')
nnoremap('<leader>td', '<cmd>Telekasten goto_today<CR>', 'Telekasten: Go to today')
nnoremap('<leader>tz', '<cmd>Telekasten follow_link<CR>', 'Telekasten: Follow link')
nnoremap('<leader>tn', '<cmd>Telekasten new_note<CR>', 'Telekasten: New Note')
nnoremap('<leader>tt', '<cmd>Telekasten new_templated_note<CR>', 'Telekasten: New templated note')
nnoremap('<leader>tc', '<cmd>Telekasten show_calendar<CR>', 'Telekasten: Show calendar')
nnoremap('<leader>tb', '<cmd>Telekasten show_backlinks<CR>', 'Telekasten: Show backlinks')
nnoremap('<leader>tI', '<cmd>Telekasten insert_img_link<CR>', 'Telekasten: insert image link')
nnoremap('<leader>to', '<cmd>Telekasten toggle_todo<CR>', 'Telekasten: Toggle todo.')

