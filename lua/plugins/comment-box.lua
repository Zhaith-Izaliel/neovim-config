local utils = require("utils")
local nnoremap = utils.nnoremap

require('comment-box').setup()

nnoremap("CBcat", require("comment-box").catalog, "Comment Box: Open catalog.")
