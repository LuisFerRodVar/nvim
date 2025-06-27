return {
	"zk-org/zk-nvim",
	lazy = true,
	config = function()
		require("zk").setup({
			picker = "snacks_picker",
			lsp = {
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
				},
				auto_attach = {
					enabled = true,
					filetypes = { "markdown" },
				},
			},
		})

		vim.keymap.set(
			"n",
			"<leader>zn",
			"<cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>",
			{ desc = "Create new note" }
		)
		vim.keymap.set("n", "<leader>zo", "<cmd>ZkNotes<CR>", { desc = "Search notes" })
		vim.keymap.set("n", "<leader>zt", "<cmd>ZkTags<CR>", { desc = "View tags" })
		vim.keymap.set("n", "<leader>zl", "<cmd>ZkLinks<CR>", { desc = "View links" })
		vim.keymap.set("v", "<leader>zf", ":'<,'>ZkMatch<CR>", { desc = "Search by selected text" })
	end,

	-- Lazy loading si hay un `.zk` en el directorio
	init = function()
		local function check_and_load_zk()
			local cwd = vim.fn.getcwd()
			if vim.fn.isdirectory(cwd .. "/.zk") == 1 then
				require("lazy").load({ plugins = { "zk-nvim" } })
			end
		end
		vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
			callback = check_and_load_zk,
		})
	end,
}
