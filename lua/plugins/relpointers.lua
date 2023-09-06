local macchiato = require("catppuccin.palettes").get_palette "macchiato"

require("relpointers").setup({
    amount = 2,
    distance = 5,

    hl_properties = {
    	underline = false,
    	bold = true,
    	fg = macchiato.subtext1,
    },

    pointer_style = "virtual",

    virtual_pointer_text = "󰧞",
})

