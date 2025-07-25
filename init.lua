-- ============================================================================
-- Neovim Configuration Entry Point
-- ============================================================================

-- Load core configuration
require("core.options")
require("core.keymaps")
require("config.git")

-- ============================================================================
-- Plugin Manager Setup (lazy.nvim)
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end

vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Plugin Configuration
-- ============================================================================

require("lazy").setup(require("plugins"))

-- Set colorscheme
vim.cmd([[colorscheme nord]])

-- ============================================================================
-- LSP Configuration
-- ============================================================================

require("lsp").setup()

-- ============================================================================
-- Custom Autocommands & Commands
-- ============================================================================

-- Disable blink for AvanteInput filetype
local blink_augroup = vim.api.nvim_create_augroup("BlinkDisable", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = blink_augroup,
    pattern = "AvanteInput",
    callback = function()
        vim.b.blink_enabled = false
    end,
})

-- Custom command to show diagnostics
vim.api.nvim_create_user_command("ShowDiagnostics", function()
    local diagnostics = vim.diagnostic.get(0)
    for _, diag in ipairs(diagnostics) do
        print(string.format("Line %d, Col %d: %s", diag.lnum + 1, diag.col + 1, diag.message))
    end
end, {})
