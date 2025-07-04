return {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local function set_transparency(enabled)
			vim.g.nord_disable_background = enabled
			require("nord").set()
		end

		set_transparency(true)
	end,
}
