-- ============================================================================
-- LSP Server Configuration Manager
-- ============================================================================

local M = {}

-- List of LSP servers to enable
local servers = {
    "lua_ls",
    "ts_ls", 
    "angularls",
    "cssls",
    "html",
    "rust_analyzer",
    "pylsp",
    "bashls",
    "markdown_oxide",
    "marksman",
}

-- Enable all configured LSP servers
function M.setup()
    for _, server in ipairs(servers) do
        vim.lsp.enable(server)
    end
end

return M