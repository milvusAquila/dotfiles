vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.wo.number = true
vim.wo.relativenumber = true
-- install and load `lazy` plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"Mofiqul/dracula.nvim",
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.nvim-tree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"rust-analyzer",
				"clang-format",
				"cpplint",
				"cpptools",
				"html-lsp",
				"css-lsp",
				"pylint",
				"pyre",
				"pyright",
				"python-lsp-server",
				"isort",
				"pylizer",
			},
		},
	},
	--"williamboman/nvim-lsp-installer",
	"neovim/nvim-lspconfig",
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
	},
	--spec = {
	--spec = 	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	--spec = 	{ import = "lazyvim.plugins.extras.lang.rust" },
	--spec = },
})

-- config require for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.showmode = true
set.ignorecase = true
set.smartcase = true
set.expandtab = true
--vim.cmd([[ colorscheme dracula ]])
--require("mason").setup({
--    ui = {
--        icons = {
--            package_installed = "✓",
--            package_pending = "➜",
--            package_uninstalled = "✗"
--        }
--    }
--})
--require("nvim-lsp-installer").setup()
--require("lspconfig").rust_analyzer.setup{}
