local Utils = require("utils");
local noremap = Utils.noremap;

local flash = require("flash");

noremap({ "n", "x", "o" }, "<leader>s", function() flash.jump() end, "Flash: Jump")
noremap({ "n", "x", "o" }, "<leader>S", function() flash.treesitter() end, "Flash: Treesitter")
noremap("o", "r", function() flash.remote() end, "Flash: Remote Flash")
noremap({ "o", "x" }, "R", function() flash.treesitter_search() end, "Flash: Treesitter Search" )
noremap({ "c" }, "<c-s>", function() flash.toggle() end, "Flash: Toggle Flash Search" )

