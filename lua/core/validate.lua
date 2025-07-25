-- ============================================================================
-- Configuration Validation Utilities
-- ============================================================================

local M = {}

-- Check if all required LSP servers are available
function M.check_lsp_servers()
    local servers = require("lsp").servers or {}
    local missing = {}
    
    for _, server in ipairs(servers) do
        local ok = pcall(vim.lsp.enable, server)
        if not ok then
            table.insert(missing, server)
        end
    end
    
    if #missing > 0 then
        vim.notify("Missing LSP servers: " .. table.concat(missing, ", "), vim.log.levels.WARN)
    else
        vim.notify("All LSP servers are available", vim.log.levels.INFO)
    end
end

-- Validate plugin categories
function M.check_plugins()
    local categories = { "ui", "editor", "lsp", "git", "integration", "ai" }
    local missing = {}
    
    for _, category in ipairs(categories) do
        local ok, _ = pcall(require, "plugins." .. category)
        if not ok then
            table.insert(missing, category)
        end
    end
    
    if #missing > 0 then
        vim.notify("Missing plugin categories: " .. table.concat(missing, ", "), vim.log.levels.WARN)
    else
        vim.notify("All plugin categories loaded successfully", vim.log.levels.INFO)
    end
end

-- Run all validation checks
function M.validate_config()
    M.check_plugins()
    M.check_lsp_servers()
end

-- Create user command for validation
vim.api.nvim_create_user_command("ValidateConfig", M.validate_config, {
    desc = "Validate Neovim configuration"
})

return M