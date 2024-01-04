local utils = require("utils")
local nnoremap = utils.nnoremap

vim.g.caser_no_mappings = 1;

nnoremap("gsp", "<Plug>CaserMixedCase", "Caser: Switch case to `PascalCase`.")
nnoremap("gsc", "<Plug>CaserCamelCase", "Caser: Switch case to `camelCase`.")
nnoremap("gs_", "<Plug>CaserSnakeCase", "Caser: Switch case to `snake_case`.")
nnoremap("gsu", "<Plug>CaserUpperCase", "Caser: Switch case to `UPPER_CASE`.")
nnoremap("gsU", "gsu", "Caser: Switch case to `UPPER_CASE`.")
nnoremap("gst", "<Plug>CaserTitleCase", "Caser: Switch case to `Title Case`.")
nnoremap("gss", "<Plug>CaserSentenceCase", "Caser: Switch case to `Sentence case`.")
nnoremap("gs<space>", "<Plug>CaserSpaceCase", "Caser: Switch case to `space case`.")
nnoremap("gs-", "<Plug>CaserKebabCase", "Caser: Switch case to `kebab-case`.")
nnoremap("gsk", "gs-", "Caser: Switch case to `kebab-case`.")
nnoremap("gsK", "<Plug>CaserTitleKebabCase", "Caser: Switch case to `Title-Kebab-Case`.")
nnoremap("gs.", "<Plug>CaserDotCase", "Caser: Switch case to `dot.case`.")
