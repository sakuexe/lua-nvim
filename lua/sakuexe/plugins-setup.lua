-- Automatically installs and sets up packer.nvim when you clone this config

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
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
  use "wbthomason/packer.nvim"

  -- Lua functions that many plugins use
  use "nvim-lua/plenary.nvim"

  -- Colorschemes
  use "phanviet/vim-monokai-pro"
  use "Shatur/neovim-ayu"
  use "tribela/vim-transparent"

  -- Essential nvim plugins
  use 'tpope/vim-surround' -- ysw & csw
  use 'tpope/vim-commentary' -- gc

  -- File explorer
  use "nvim-tree/nvim-tree.lua"

  -- Icons
  use "nvim-tree/nvim-web-devicons"

  -- Statusline
  use "nvim-lualine/lualine.nvim"

  -- Fuzzy finding with telescope

  -- Autocompletion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- Managing and installing LSP servers
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  --Configuring LSP servers
  use "neovim/nvim-lspconfig" -- easily configure language servers
  use "hrsh7th/cmp-nvim-lsp"  -- for autocompletion
  use { "glepnir/lspsaga.nvim", branch = "main" } -- enhanced lsp UIs
  use "jose-elias-alvarez/typescript.nvim" -- additional functionality for typescript server
  use "onsails/lspkind.nvim" -- vscode like icons for autocompletion

  if packer_bootstrap then
    require("packer").sync()
  end
end)
