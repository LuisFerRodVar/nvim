return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
					auto_trigger = false,
				},
			})
			vim.keymap.set("n", "<leader>ae", function()
				vim.cmd("Copilot enable")
				vim.notify("Copilot enabled")
			end, { desc = "Enable Copilot" })
			vim.keymap.set("n", "<leader>ad", function()
				vim.cmd("Copilot disable")
				vim.notify("Copilot disabled")
			end, { desc = "Disable Copilot" })
		end,
	},
}
