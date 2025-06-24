return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		require("Comment").setup({
			---Add padding between `//` and text
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to ignore when (un)commenting
			ignore = nil,
			---LHS of toggle mappings
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			---LHS of operator-pending mappings
			opleader = {
				line = "gc",
				block = "gb",
			},
			---Enable keybindings
			mappings = {
				basic = true,
				extra = true,
			},
		})
	end,
}
