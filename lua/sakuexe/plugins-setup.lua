-- Automatically installs and sets up packer.nvim when you clone this config

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Protected call for packer, if fails, then returns
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- Colorschemes
	use("Shatur/neovim-ayu")
	use("phanviet/vim-monokai-pro")
	use("whatsthatsmell/codesmell_dark.vim")
	use("xiyaowong/nvim-transparent")

	-- Essential nvim plugins
	use("tpope/vim-surround") -- ysw & csw
	use("tpope/vim-commentary") -- gc

	-- auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- File explorer
	use("nvim-tree/nvim-tree.lua")

	-- Fuzzy finding with telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for fuzzy finder
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- Statusline
	use("nvim-lualine/lualine.nvim")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Managing and installing LSP servers, linters and formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	--Configuring LSP servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp UIs
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server
	use("onsails/lspkind.nvim") -- vscode like icons for autocompletion

	-- Formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- git-signs plugin
	use("lewis6991/gitsigns.nvim")

	-- Better terminal for Neovim
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
