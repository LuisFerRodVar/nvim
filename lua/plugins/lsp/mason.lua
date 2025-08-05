return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			local servers = {
				lua_ls = {},
				ts_ls = {},
				rust_analyzer = {},
				pyright = {},
			}

			for server, config in pairs(servers) do
				lspconfig[server].setup(config)
			end
		end,
	},
}
