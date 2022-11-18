-- for customisation options check lualine repository:
-- https://github.com/nvim-lualine/lualine.nvim

local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lualine_ayu = require("lualine.themes.ayu")

local my_colors = {
	orange = "#c47443",
	violet = "#9970c4",
	lavender = "#552f7d",
	red = "#db353d",
	yellow = "#dba935",
	green = "#63bf50",
	turqoise = "#35dbba",
	black = "#000000",
	white = "#ffffff",
	darkgray = "#2e2c30",
}

lualine_ayu.normal.a.bg = my_colors.orange
lualine_ayu.insert.a.bg = my_colors.lavender
lualine_ayu.visual.a.bg = my_colors.violet
lualine_ayu.replace.a.bg = my_colors.red

lualine_ayu.command = {
	a = {
		gui = "bold",
		bg = my_colors.green,
		fg = my_colors.black,
	},
}

lualine.setup({
	options = {
		theme = lualine_ayu,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		--  
	},

	sections = {
		lualine_a = { "mode" },
		-- lualine_b = { "branch", "diff", "diagnostics" }
		lualine_b = { "branch", "diagnostics" },
		lualine_c = { "buffers" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "filename" },
		lualine_z = { "location" },
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},

	tabline = {
		lualine_a = {
			{
				"buffers",
				buffers_color = {
					active = { bg = my_colors.black, fg = my_colors.lavender },
					inactive = { bg = my_colors.black, fg = my_colors.darkgray },
				},
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
})
