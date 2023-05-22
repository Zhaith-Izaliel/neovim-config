-- ---------------
-- ---Formatter---
-- ---------------

require('strict').setup {
  excluded_filetypes = { 'text', 'html', 'vue', 'scss',
    'less', 'make' },
  deep_nesting = {
    ignored_trailing_characters = ',',
    ignored_leading_characters = '.',
  },
   trailing_whitespace = {
    highlight = true,
    remove_on_save = true
  },
  overlong_lines = {
    length_limit = LAST_COLUMN,
  },
  trailing_empty_lines = {
    highlight = false,
    remove_on_save = false,
  },
  todos = {
    highlight = false,
  },
  tab_indentation = {
    highlight = true,
    highlight_group = 'SpellBad',
    convert_on_save = true
  },
}

