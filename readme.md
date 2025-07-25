# Neovim Configuration

A modern, organized Neovim configuration using Lua with lazy.nvim plugin management.

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration entry point
├── lua/
│   ├── core/                   # Core Neovim settings
│   │   ├── options.lua         # Vim options and settings
│   │   └── keymaps.lua         # Key mappings
│   ├── config/                 # Additional configurations
│   │   └── git.lua             # Git-specific settings
│   ├── lsp/                    # Language Server Protocol configs
│   │   ├── init.lua            # LSP manager
│   │   ├── lua_ls.lua          # Lua language server
│   │   ├── ts_ls.lua           # TypeScript language server
│   │   └── ...                 # Other language servers
│   └── plugins/                # Plugin configurations
│       ├── ui/                 # UI & appearance plugins
│       ├── editor/             # Editor enhancement plugins
│       ├── lsp/                # LSP & development tools
│       ├── git/                # Git integration plugins
│       ├── integration/        # External tool integrations
│       └── ai/                 # AI assistance plugins
├── AGENTS.md                   # Guidelines for AI coding agents
└── lazy-lock.json              # Plugin version lockfile
```

## 🚀 Features

- **Modern Plugin Management**: Using lazy.nvim for fast startup times
- **Organized Structure**: Plugins categorized by functionality
- **LSP Integration**: Full language server support for multiple languages
- **Git Integration**: Built-in Git workflow tools
- **AI Assistance**: Multiple AI coding assistants (Copilot, Avante, etc.)
- **File Explorer**: Snacks.nvim integrated file browser
- **Fuzzy Finding**: Advanced file and content searching
- **Beautiful UI**: Nord colorscheme with custom statusline

## 📋 Requirements

- Neovim v0.11+
- Git
- Node.js (for some LSP servers)
- Optional: stylua (for Lua formatting)

## 🛠️ Installation

1. Backup your existing Neovim configuration
2. Clone or copy this configuration to `~/.config/nvim/`
3. Launch Neovim - plugins will install automatically
4. Run `:checkhealth` to verify everything is working

## ⌨️ Key Mappings

### File Operations
- `<leader>ff` - Find files
- `<leader>fg` - Find git files
- `<leader>f/` - Grep in files
- `<leader>ee` - File explorer

### Git
- `<leader>gg` - LazyGit
- `<leader>gs` - Git status
- `<leader>gb` - Git branches

### LSP
- `gd` - Go to definition
- `gr` - Find references
- `<leader>ls` - Document symbols

### Buffers
- `<leader>x` - Close current buffer
- `<leader>X` - Close all other buffers

## 🔧 Customization

Edit the respective files in `lua/` to customize:
- `core/options.lua` - Vim settings
- `core/keymaps.lua` - Key mappings  
- `plugins/*/` - Plugin configurations

## 📝 Contributing

Feel free to submit issues and enhancement requests!
