local nnoremap = require("sakuexe.core.keymaphelp").nnoremap
local inoremap = require("sakuexe.core.keymaphelp").inoremap
local vnoremap = require("sakuexe.core.keymaphelp").vnoremap
local xnoremap = require("sakuexe.core.keymaphelp").xnoremap
local tnoremap = require("sakuexe.core.keymaphelp").tnoremap

-- Assign <Leader> key
vim.g.mapleader = " "

-- Exit insert mode without pressing CTRL-CEscape
inoremap("kj", "<Esc>")
inoremap("jk", "<Esc>")

-- Remove search highlighting with CTRL-N
nnoremap("<Leader>nh", ":nohlsearch<CR>")

-- Set space-tab to move between buffers
nnoremap("<Leader><Tab>", ":bnext<CR>")
nnoremap("<Leader><S-Tab>", ":bprev<CR>")

-- Set space-w to work as CTRL-w
nnoremap("<leader>w", "<C-w>")

-- swap esc and capslock:
-- setxkbmap -option caps:swapescape

-- Set ALT+movement keys to resize window
nnoremap("<M-j>", ":resize +1<CR>")
nnoremap("<M-k>", ":resize -1<CR>")
nnoremap("<M-h>", ":vertical resize +1<CR>")
nnoremap("<M-l>", ":vertical resize -1<CR>")

-- Better indenting - Doesn't remove visual mode when indenting
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Incredible keymaps, pastes and removes text without putting it in clipboard
xnoremap("<leader>p", '"_dP')
nnoremap("x", '"_x')

-- Increases/Decreases numbers incrementally
nnoremap("<leader>+", "<C-a>")
nnoremap("<leader>-", "<C-a>")

-- Split window hotkeys
nnoremap("<leader>sv", "<C-w>v") -- split vertically
nnoremap("<leader>sh", "<C-w>s") -- split horizontally
nnoremap("<leader>se", "<C-w>=") -- make splits equal width
nnoremap("<leader>sx", ":close<CR>") -- close current split

-- Buffer stuff
nnoremap("<leader>bd", ":bd<CR>")

-- <[ Plugin Keymaps ]> --

-- Nvim-tree
nnoremap("<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
nnoremap("<leader>ff", ":Telescope find_files<CR>")
nnoremap("<leader>fg", ":Telescope live_grep<CR>")
nnoremap("<leader>fc", ":Telescope grep_string<CR>")
nnoremap("<leader>fb", ":Telescope buffers<CR>")
nnoremap("<leader>fh", ":Telescope help_tags<CR>")

-- ToggleTerminal
tnoremap("<Esc>", "<C-\\><C-n>:q!<CR>") -- quit terminal
