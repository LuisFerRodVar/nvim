# Neovim Configuration - Agent Instructions

## Environment
- Neovim v0.11+ configuration using Lua
- Plugin manager: lazy.nvim
- Formatters configured via conform.nvim

## Build/Lint/Test Commands
- **Format Lua**: `stylua .` (if installed) or use conform.nvim on save
- **Check syntax**: `nvim --headless -c "lua vim.cmd('checkhealth')" -c "quit"`
- **Test config**: `nvim --clean -u init.lua` to test configuration
- **No formal test suite** - validate by loading config without errors

## Code Style Guidelines
- **Indentation**: 4 spaces (no tabs), expandtab enabled
- **Naming**: snake_case for variables/functions, PascalCase for plugins
- **Imports**: Use `require()` at top of files, group by type (core, plugins, config)
- **Plugin structure**: Return table with plugin spec, use `opts` for simple config
- **Comments**: Use `--` for single line, explain complex configurations
- **Error handling**: Prefer pcall() for potentially failing operations
- **File organization**: lua/core/ for base config, lua/plugins/ for plugin specs
- **LSP config**: Enable servers in init.lua with `vim.lsp.enable()`