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
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})
