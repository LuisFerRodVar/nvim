return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lsp = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients()

			local status_list = {}

			for _, client in ipairs(clients) do
				local attached = client.attached_buffers and client.attached_buffers[bufnr]
				local initialized = client.initialized

				if attached and initialized then
					table.insert(status_list, client.name .. " ✓")
				elseif attached then
					table.insert(status_list, client.name .. " …")
				end
			end

			if #status_list == 0 then
				return ""
			end

			return table.concat(status_list, " | ")
		end
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
						tabs_color = {
							active = "lualine_a_insert",
							inactive = "lualine_c_normal",
						},
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
				lualine_y = { lsp },
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
