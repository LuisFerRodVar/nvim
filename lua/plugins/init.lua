-- ============================================================================
-- Plugin Configuration Index
-- ============================================================================
-- This file serves as the main index for all plugin configurations.
-- Plugins are organized by category for better maintainability.

local M = {}

-- Load all plugin categories
M.ui = require("plugins.ui")
M.editor = require("plugins.editor") 
M.lsp = require("plugins.lsp")
M.git = require("plugins.git")
M.integration = require("plugins.integration")
M.ai = require("plugins.ai")

-- Return flattened plugin list
local plugins = {}
for _, category in pairs(M) do
    vim.list_extend(plugins, category)
end

return plugins