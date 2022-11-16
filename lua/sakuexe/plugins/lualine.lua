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
    theme = lualine_ayu
  }
})
