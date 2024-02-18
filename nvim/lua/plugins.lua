return {
	{
		"nvim-tree/nvim-tree.lua",
--		dependencies = { "nvim-tree/nvim-web-devicons" },
--		config = function()
--			require("config.nvim-tree")
--		end,
	},
	--{
	--	"nvim-telescope/telescope.nvim",
	--	branch = "0.1.x",
	--	dependencies = { "nvim-lua/plenary.nvim" },
	--},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"rust-analyzer",
				"codelldb",
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
--			ui = {
--				icons = {
--					package_installed = "",
--					package_pending = "",
--					package_uninstalled = "",
--				},
--			},
		},
	},
	"williamboman/mason-lspconfig.nvim",
	--"williamboman/nvim-lsp-installer",
	{
		"simrat39/rust-tools.nvim",
--		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
	},
	--spec = {
	--spec = 	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	--spec = 	{ import = "lazyvim.plugins.extras.lang.rust" },
	--spec = },
}
