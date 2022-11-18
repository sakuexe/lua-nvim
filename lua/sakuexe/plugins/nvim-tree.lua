local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- Recommended settings from nvim-tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- NvimTree arrow colors
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#db6439]])

nvimtree.setup({
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				-- move in- and outwards with l and h
				{ key = "h", action = "dir_up" },
				{ key = "l", action = "dir_down" },
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
