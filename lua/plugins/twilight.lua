local Utils = require("utils")
local nnoremap = Utils.nnoremap

require("twilight").setup {}
nnoremap("<leader>t", require("twilight").toggle(), "Twilight: toggle")
