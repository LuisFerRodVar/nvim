return {
	"folke/noice.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	event = "VeryLazy",
	config = function()
		require("noice").setup({
			lsp = {
				progress = { enabled = true },
				signature = { enabled = false },
				hover = { enabled = true },
				message = { enabled = false },
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		})
	end,
}
