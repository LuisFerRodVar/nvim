return {
	"yetone/avante.nvim",
	-- Plugin configuration for avante.nvim
	build = function()
		if vim.fn.has("win32") == 1 then
			-- Build command for Windows
			return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		else
			-- Build command for other platforms
			return "make"
		end
	end,
	event = "VeryLazy", -- Load plugin lazily
	version = false, -- Disable version pinning
	dependencies = {
		"MunifTanjim/nui.nvim", -- Required dependency
		"nvim-lua/plenary.nvim",
	},
	opts = {
		provider = "copilot", -- Specify the provider
	},
	config = function(_, opts)
		-- Setup avante.nvim with provided options
		require("avante").setup(opts)

		vim.defer_fn(function()
			local set = vim.api.nvim_set_hl

			-- Configure title highlights
			set(0, "AvanteTitle", { fg = "#ECEFF4", bg = "#5E81AC", bold = true })
			set(0, "AvanteReversedTitle", { fg = "#5E81AC", bg = "#2E3440", bold = true })

			set(0, "AvanteSubtitle", { fg = "#D8DEE9", bg = "#3B4252", bold = true })
			set(0, "AvanteReversedSubtitle", { fg = "#3B4252", bg = "#2E3440", bold = true })

			set(0, "AvanteThirdTitle", { fg = "#88C0D0", bg = "#2E3440", italic = true })
			set(0, "AvanteReversedThirdTitle", { fg = "#2E3440", bg = "#2E3440", italic = true })

			set(0, "AvanteConfirmTitle", { fg = "#ECEFF4", bg = "#BF616A", bold = true })

			-- Configure button highlights
			set(0, "AvanteButtonDefault", { fg = "#2E3440", bg = "#D8DEE9" })
			set(0, "AvanteButtonDefaultHover", { fg = "#2E3440", bg = "#A3BE8C" })
			set(0, "AvanteButtonPrimary", { fg = "#2E3440", bg = "#88C0D0" })
			set(0, "AvanteButtonPrimaryHover", { fg = "#2E3440", bg = "#81A1C1" })
			set(0, "AvanteButtonDanger", { fg = "#2E3440", bg = "#BF616A" })
			set(0, "AvanteButtonDangerHover", { fg = "#2E3440", bg = "#D08770" })

			-- Configure hint and prompt highlights
			set(0, "AvantePopupHint", { fg = "#81A1C1", bg = "#2E3440", italic = true })
			set(0, "AvanteInlineHint", { fg = "#4C566A", italic = true })

			set(0, "AvantePromptInput", { fg = "#D8DEE9", bg = "#3B4252" })
			set(0, "AvantePromptInputBorder", { fg = "#88C0D0", bg = "#3B4252" })

			-- Configure comment and annotation highlights
			set(0, "AvanteCommentFg", { fg = "#616E88", bg = "#2E3440", italic = true }) -- nord3
			set(0, "AvanteSuggestion", { bg = "#2E3440" })
			set(0, "AvanteAnnotation", { bg = "#2E3440" })

			-- Configure conflict highlights
			set(0, "AvanteConflictCurrent", { fg = "#2E3440", bg = "#EBCB8B", bold = true })
			set(0, "AvanteConflictIncoming", { fg = "#2E3440", bg = "#A3BE8C", bold = true })
			set(0, "AvanteConflictCurrentLabel", { fg = "#2E3440", bg = "#D08770", bold = true })
			set(0, "AvanteConflictIncomingLabel", { fg = "#2E3440", bg = "#8FBCBB", bold = true })

			-- Configure spinner states
			set(0, "AvanteStateSpinnerGenerating", { fg = "#2E3440", bg = "#B48EAD" }) -- morado
			set(0, "AvanteStateSpinnerToolCalling", { fg = "#2E3440", bg = "#88C0D0" })
			set(0, "AvanteStateSpinnerFailed", { fg = "#2E3440", bg = "#BF616A" })
			set(0, "AvanteStateSpinnerSucceeded", { fg = "#2E3440", bg = "#A3BE8C" })
			set(0, "AvanteStateSpinnerSearching", { fg = "#2E3440", bg = "#B48EAD" })
			set(0, "AvanteStateSpinnerThinking", { fg = "#2E3440", bg = "#B48EAD" })
			set(0, "AvanteStateSpinnerCompacting", { fg = "#2E3440", bg = "#B48EAD" })

			-- Configure additional highlights
			set(0, "AvanteToBeDeleted", { bg = "#BF616A", strikethrough = true })
			set(0, "AvanteToBeDeletedWOStrikethrough", { bg = "#562C30" })

			set(0, "AvanteSidebarWinSeparator", { fg = "#4C566A", bg = "#2E3440" })
			set(0, "AvanteSidebarWinHorizontalSeparator", { fg = "#434C5E", bg = "#2E3440" })
			set(0, "AvanteSidebarNormal", { fg = "#D8DEE9", bg = "#2E3440" })

			set(0, "AvanteReversedNormal", { fg = "#2E3440", bg = "#D8DEE9" })

			set(0, "AvanteTaskCompleted", { fg = "#A3BE8C", bg = "#2E3440" })
			set(0, "AvanteThinking", { fg = "#B48EAD", bg = "#2E3440" })
		end, 50)
	end,
}
