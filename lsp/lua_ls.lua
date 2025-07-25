return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".git",
	},
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			signatureHelp = { enabled = true },
			diagnostics = {
				globals = { "vim" }, -- 🔧 reconoce la global `vim`
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME, -- 🔧 incluye la runtime de Neovim
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.stdpath("config") .. "/lua",
				},
				checkThirdParty = false, -- 🔧 evita advertencias innecesarias
			},
			telemetry = {
				enable = false, -- 🔕 evita enviar datos de uso
			},
		},
	},
}
