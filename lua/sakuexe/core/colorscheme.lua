local status, _ = pcall(vim.cmd, "colorscheme palenightfall")
if not status then
	print("Colorscheme not found")
	return
end

local status_transparent, _ = pcall(vim.cmd, "TransparentEnable")
if status_transparent then
	print("Running :TransparentEnable")
	return
end

if vim.fn.has("termguicolors") then
	vim.opt.termguicolors = true
end
