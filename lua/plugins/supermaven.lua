return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		local api = require("supermaven-nvim.api")

		require("supermaven-nvim").setup({
			autostart = false,
			keymaps = {
				accept_suggestion = "<C-a>",
			},
		})
		vim.schedule(function()
			if api.is_running() then
				api.stop()
			end
		end)
		vim.keymap.set("n", "<leader>a", function()
			if api.is_running() then
				api.stop()
				vim.notify("AI disabled", vim.log.levels.INFO)
			else
				api.start()
				vim.notify("AI enabled", vim.log.levels.INFO)
			end
		end, { desc = "Toggle Supermaven", noremap = true, silent = true })
	end,
}
