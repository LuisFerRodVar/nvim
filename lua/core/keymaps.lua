-- leader key config
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })


-- window manager keymaps
-- Window management keymaps
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>s", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Create a new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })

vim.keymap.set("n", "<leader>rn", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative line numbers" })
vim.keymap.set("n", "<leader>n", "<cmd>set number!<CR>", { desc = "Toggle line numbers" })

vim.keymap.set("n", "<leader>qL", function()
	for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
		vim.lsp.buf_detach_client(0, client.id)
	end
	vim.notify("LSP detached from current buffer", vim.log.levels.INFO)
end, { desc = "Detach LSP from current buffer" })
