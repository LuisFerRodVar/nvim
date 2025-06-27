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
	end,
	-- Check if the current directory is zk
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
