return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "nord",
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "snacks_picker_input", "snacks_dashboard", "snacks_terminal" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"tabs",
						tab_max_length = 40,
						max_length = vim.o.columns / 3,
						mode = 1,
						path = 0,
						use_mode_colors = true,
						tabs_color = {},
						show_modified_status = false,
						symbols = {
							modified = "",
						},
						fmt = function(name, context)
							local buflist = vim.fn.tabpagebuflist(context.tabnr)
							local winnr = vim.fn.tabpagewinnr(context.tabnr)
							local bufnr = buflist[winnr]
							local mod = vim.fn.getbufvar(bufnr, "&mod")
							return name .. (mod == 1 and " ●" or "")
						end,
					},
				},
				lualine_x = { "diff", "diagnostics", "filetype" },
				lualine_y = { "lsp_status" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "fugitive", "lazy", "man", "nvim-tree", "toggleterm", "quickfix" },
		})
	end,
}
