local Utils = require("utils")
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local nnoremap = Utils.nnoremap

require("twilight").setup {
	dimming = {
		alpha = 0.15, -- amount of dimming
		-- we try to get the foreground from the highlight groups or fallback color
		color = { "Normal", macchiato.text },
		term_bg = macchiato.base,
	},
}
nnoremap("<leader>t", require("twilight").toggle, "Twilight: toggle")
