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

-- Habilita autoread globalmente
vim.o.autoread = true

-- Check for external changes (oriented to use with opencode)
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	command = "checktime",
})

-- Custom command to show diagnostics
vim.api.nvim_create_user_command("ShowDiagnostics", function()
	local diagnostics = vim.diagnostic.get(0)
	local all = ""
	for _, diag in ipairs(diagnostics) do
		local msg = string.format("Line %d, Col %d: %s\n", diag.lnum + 1, diag.col + 1, diag.message)
		all = all .. msg
		print(msg:sub(1, -2))
	end
	vim.system({ "wl-copy" }, { stdin = all })
end, {})
