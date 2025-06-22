require("core.options")
require("core.keymaps")
require("config.git")

-- Set Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.colortheme"),
	require("plugins.snacks"),
	require("plugins.which-key"),
	require("plugins.lualine"),
	require("plugins.blink"),
	require("plugins.mason"),
	require("plugins.treesitter"),
	require("plugins.conform"),
	require("plugins.gitsigns"),
})
-- lsp config
vim.lsp.enable("lua_ls")
