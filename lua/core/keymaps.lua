-- ============================================================================
-- Key Mappings Configuration
-- ============================================================================

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable Space in normal and visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- ============================================================================
-- Window Management
-- ============================================================================

vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>s", "<C-w>s", { desc = "Split window horizontally" })

-- ============================================================================
-- Tab Management  
-- ============================================================================

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Create a new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })

-- ============================================================================
-- UI Toggles
-- ============================================================================

vim.keymap.set("n", "<leader>rn", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative line numbers" })
vim.keymap.set("n", "<leader>n", "<cmd>set number!<CR>", { desc = "Toggle line numbers" })

-- ============================================================================
-- LSP Management
-- ============================================================================

vim.keymap.set("n", "<leader>qL", function()
    for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
        vim.lsp.buf_detach_client(0, client.id)
    end
    vim.notify("LSP detached from current buffer", vim.log.levels.INFO)
end, { desc = "Detach LSP from current buffer" })
