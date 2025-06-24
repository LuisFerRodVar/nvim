return {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local is_transparent = true

		local function set_transparency(enabled)
			vim.g.nord_disable_background = enabled
			require("nord").set()
		end

		local function toggle_transparency()
			is_transparent = not is_transparent
			set_transparency(is_transparent)
		end

		set_transparency(is_transparent)

		vim.keymap.set("n", "<leader>bg", toggle_transparency, {
			desc = "Alternar transparencia de Neovim",
			noremap = true,
			silent = true,
		})
	end,
}
