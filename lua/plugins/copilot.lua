return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<C-a>",
						next = "<C-j>",
						prev = "<C-k>",
						dismiss = "<C-x>",
					},
				},
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						open = "<C-o>",
						accept = "<CR>",
						refresh = "gr",
						jump_prev = "[[",
						jump_next = "]]",
					},
				},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			"github/copilot.vim",
			"nvim-lua/plenary.nvim",
		},
		build = "make tiktoken",
		cmd = "CopilotChat",
		opts = {
			window = {
				layout = "float",
				width = 80,
				height = 20,
			},
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Open Copilot chat" },
			{ "<leader>ct", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
			{ "<leader>cv", "<cmd>CopilotChatVisual<cr>", mode = "v", desc = "Chat selected text" },
			{ "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = "v", desc = "Optimize" },
			{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = "v", desc = "Explain" },
			{ "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = "v", desc = "Fix" },
			{ "<leader>cg", "<cmd>CopilotChatTests<cr>", mode = "v", desc = "Test" },
			{ "<leader>cd", "<cmd>CopilotChatDocs<cr>", mode = "v", desc = "Docs" },
			{ "<leader>cm", "<cmd>CopilotChatCommit<cr>", desc = "Commit sugestion" },
		},
	},
}
