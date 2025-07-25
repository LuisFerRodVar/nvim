return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		require("Comment").setup({
			---Add padding between `//` and text
			-- @type boolean
			padding = true,
			---Whether the cursor should stay at its position
			-- @type boolean
			sticky = true,
			---Lines to ignore when (un)commenting
			-- @type function|nil
			ignore = nil,
			---LHS of toggle mappings
			-- @type table
			toggler = {
				---Keymap for toggling line comments
				line = "gcc",
				---Keymap for toggling block comments
				block = "gbc",
			},
			---LHS of operator-pending mappings
			-- @type table
			opleader = {
				---Keymap for line comment
				line = "gc",
				---Keymap for block comment
				block = "gb",
			},
			---Enable keybindings
			-- @type table
			mappings = {
				---Enable basic mappings like `gcc`, `gbc`, `gc[count]{motion}`, `gb[count]{motion}`
				basic = true,
				---Enable extra mappings like `gco`, `gcO`, `gcA`
				extra = true,
			},
		})
	end,
}
