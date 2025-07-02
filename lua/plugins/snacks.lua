return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		animate = { enabled = true },
		bigfile = { enabled = true },
		notifier = { enabled = true },
		dashboard = { enabled = true },
		indent = {
			enabled = true,
			animate = {
				enabled = false,
			},
		},
		quickfile = { enabled = true },
		bufdelete = { enabled = true },
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
		git = { enabled = true },
		statuscolumn = {
			enabled = true,
		},
		input = { enabled = true },
		lazygit = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				explorer = {
					hidden = false,
					ignored = false,
					exclude = { "node_modules/**", ".git/**", "dist/**" },
				},
				files = {
					hidden = false,
					ignored = false,
					exclude = { "node_modules/**", ".git/**", "dist/**" },
				},
			},
		},
		image = { enabled = true },
		toggle = { enabled = true },
		scratch = { enabled = true },
	},
	keys = {
		-- Picker
		-- File/Buffer/Project Finders
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find File",
		},
		{
			"<leader>fF",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find Buffer",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Find Project",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Find Recent File",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git File",
		},
		{
			"<leader>f/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep in Files",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep Word (Visual/Normal)",
			mode = { "n", "x" },
		},
		{
			"<leader>fl",
			function()
				Snacks.picker.lines()
			end,
			desc = "Find Line in Buffer",
		},
		{
			"<leader>fB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep in Open Buffers",
		},
		{
			"<leader>hh",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>h/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"<leader>hn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notifications",
		},
		{
			"<leader>hr",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume Picker",
		},
		{
			"<leader>hu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			"<leader>ee",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>ej",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jump List",
		},
		{
			"<leader>em",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>el",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			"<leader>eq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>uc",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>ua",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			"<leader>ur",
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>uk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>uh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>uH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlight Groups",
		},
		{
			"<leader>um",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>up",
			function()
				Snacks.picker.lazy()
			end,
			desc = "Plugin Specs (Lazy)",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Line History",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git File History",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		-- Normal LSP mappings
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Go to Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Go to Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "Find References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Go to Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Type Definition",
		},
		-- Symbols
		{
			"<leader>ls",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Document Symbols",
		},
		{
			"<leader>lS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "Workspace Symbols",
		},
		{
			"<leader>ld",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>lD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		-- Buffdelete
		{
			"<leader>x",
			function()
				Snacks.bufdelete.delete(opts)
			end,
			desc = "Close current buffer",
		},
		{
			"<leader>X",
			function()
				Snacks.bufdelete.other(opts)
			end,
			desc = "Close all buffer except the current one",
		},
		-- Lazy git
		{
			"<leader>gg",
			function()
				Snacks.lazygit.open(opts)
			end,
			desc = "Open lazy git",
		},
	},
}
