return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-a>",
			},
		})
		vim.cmd("SupermavenToggle")
		vim.keymap.set(
			"n",
			"<leader>a",
			"<cmd>SupermavenToggle<cr>",
			{ desc = "Toggle suepermaven", noremap = true, silent = true }
		)
	end,
}
