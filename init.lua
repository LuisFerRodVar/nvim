require("core.options")
require("core.keymaps")
require("config.git")

-- Set Lazy plugin manager
-- Define the path for the lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim exists; if not, clone it
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

	-- Handle errors during cloning
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

-- Prepend lazy.nvim to the runtime path
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim with plugins
require("lazy").setup({
	require("plugins.colortheme"), -- Color scheme plugin
	require("plugins.snacks"), -- Lightweight snack plugin
	require("plugins.which-key"), -- Keybinding helper plugin
	require("plugins.lualine"), -- Status line plugin
	require("plugins.blink"), -- Cursor blink enhancement plugin
	require("plugins.mason"), -- LSP and DAP package manager plugin
	require("plugins.treesitter"), -- Syntax highlighting plugin
	require("plugins.conform"), -- Code formatting plugin
	require("plugins.gitsigns"), -- Git integration plugin
	require("plugins.tmux"), -- Tmux integration plugin
	require("plugins.autopairs"), -- Autopairs plugin for brackets
	require("plugins.comment"), -- Commenting plugin
	require("plugins.zk"), -- Note-taking plugin
	require("plugins.copilot"), -- AI-assisted coding plugin
	require("plugins.avante"), -- Avante plugin
})

-- LSP configuration
-- Enable language servers for various programming languages
vim.lsp.enable("lua_ls") -- Lua language server
vim.lsp.enable("ts_ls") -- TypeScript language server
vim.lsp.enable("angularls") -- Angular language server
vim.lsp.enable("cssls") -- CSS language server
vim.lsp.enable("html") -- HTML language server
vim.lsp.enable("rust_analyzer") -- Rust language server
vim.lsp.enable("pylsp") -- Python language server
vim.lsp.enable("bashls") -- Bash language server

local blink_augroup = vim.api.nvim_create_augroup("BlinkDisable", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = blink_augroup,
	pattern = "AvanteInput",
	callback = function()
		vim.b.blink_enabled = false
	end,
})
