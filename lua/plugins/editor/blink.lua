return {
	"saghen/blink.cmp", -- Plugin name: Blink Completion Manager
	version = "1.*", -- Specifies compatible version of the plugin
	dependencies = { -- List of plugin dependencies
		{
			"rafamadriz/friendly-snippets", -- Provides pre-defined snippets for enhanced coding experience
		},
		{
			"giuxtaposition/blink-cmp-copilot", -- Adds Copilot support for Blink Completion Manager
		},
	},
	opts = { -- Plugin options
		enabled = function()
			return not vim.tbl_contains({ "AvanteInput", "AvantePromptInput" }, vim.bo.filetype)
		end, -- Enable plugin except for Avante filetype
		keymap = { -- Keybindings for various actions
			preset = "none", -- Disables preset keymap
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" }, -- Control+Space: Show/hide documentation
			["<C-e>"] = { "hide", "fallback" }, -- Control+E: Hide with fallback

			["<CR>"] = { -- Enter key: Accept or select and accept depending on snippet activity
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-CR>"] = { "snippet_backward", "fallback" }, -- Shift+Enter: Move snippet backward
			["<S-Tab>"] = { "select_prev", "fallback" }, -- Shift+Tab: Select previous item
			["<Tab>"] = { "select_next", "fallback" }, -- Tab: Select next item
			["<C-p>"] = { "select_prev", "fallback_to_mappings" }, -- Control+P: Select previous with fallback
			["<C-n>"] = { "select_next", "fallback_to_mappings" }, -- Control+N: Select next with fallback
			["<C-b>"] = { "scroll_documentation_up", "fallback" }, -- Control+B: Scroll documentation up
			["<C-f>"] = { "scroll_documentation_down", "fallback" }, -- Control+F: Scroll documentation down
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" }, -- Control+K: Show/hide signature with fallback
		},

		appearance = { -- UI appearance settings
			nerd_font_variant = "normal", -- Font variant for icons
		},

		completion = { -- Completion settings
			documentation = { auto_show = true }, -- Automatically show documentation
			menu = { -- Menu settings
				draw = {
					components = {
						kind_icon = { -- Configure icons for completion kinds
							text = function(ctx)
								return " " .. ctx.kind_icon .. ctx.icon_gap .. " " -- Icon text formatting
							end,
						},
					},
				},
			},
		},

		sources = { -- Sources configuration for completion
			default = { "lsp", "path", "snippets", "buffer", "copilot" }, -- Default sources for completion
			providers = { -- Source providers
				copilot = { -- Copilot configuration
					name = "copilot", -- Provider name
					module = "blink-cmp-copilot", -- Module name
					score_offset = 100, -- Scoring offset for ranking
					async = true, -- Enables asynchronous completion
				},
			},
		},
		signature = { enabled = true }, -- Enable signature help
		fuzzy = { implementation = "prefer_rust_with_warning" }, -- Fuzzy matching configuration
	},
	opts_extend = { "sources.default" }, -- Extend sources configuration with default sources
}
