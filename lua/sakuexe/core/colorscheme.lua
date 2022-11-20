local status, _ = pcall(vim.cmd, "colorscheme ayu-dark")
if not status then
	print("Colorscheme not found")
	return
end

local transparent_status, transparent = pcall(require, "transparent")
if not transparent_status then
	print("Transparency plugin not found")
	return
end

transparent.setup({
	enable = true,
})
