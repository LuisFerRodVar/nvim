return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			lightbulb = { enable = false },
			symbol_in_winbar = { enable = false },
			ui = {
				border = "rounded",
				code_action = "💡",
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
