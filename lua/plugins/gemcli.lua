return {
	{
		"LuisFerRodVar/gemcli.nvim",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
				opts = function(_, opts)
					opts.ensure_installed = opts.ensure_installed or {}
					vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
				end,
			},
			{
				"lukas-reineke/headlines.nvim",
				opts = {},
				ft = { "markdown" },
			},
		},
		keys = {
			{
				"<leader>aa",
				function()
					require("gemcli").ask_prompt_streamed()
				end,
				desc = "Preguntar a Gemini",
			},
			{
				"<leader>as",
				function()
					require("gemcli").ask_visual_streamed()
				end,
				mode = "v",
				desc = "Gemini desde selección",
			},
			{
				"<leader>ah",
				function()
					require("gemcli").hide()
				end,
				mode = "n",
				desc = "Hide gemini response",
			},
			{
				"<leader>at",
				function()
					require("gemcli").show()
				end,
				mode = "n",
				desc = "Show gemini response",
			},
			{
				"<leader>am",
				function()
					require("gemcli").toggle_model()
				end,
				mode = "n",
				desc = "Toggle between models",
			},
		},
	},
}
