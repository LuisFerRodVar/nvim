# Neovim Configuration

A modern, organized Neovim configuration using Lua with lazy.nvim plugin management.

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration entry point
├── lua/
│   ├── core/                   # Core Neovim settings
│   │   ├── options.lua         # Vim options and settings
│   │   ├── keymaps.lua         # Key mappings
│   │   └── validate.lua        # Configuration validation
│   ├── config/                 # Additional configurations
│   │   └── git.lua             # Git-specific settings
│   ├── lsp/                    # Language Server Protocol configs
│   │   ├── init.lua            # LSP initialization
│   │   ├── angularls.lua       # Angular language server
│   │   ├── bashls.lua          # Bash language server
│   │   ├── cssls.lua           # CSS language server
│   │   ├── html.lua            # HTML language server
│   │   ├── lua_ls.lua          # Lua language server
│   │   ├── markdown_oxide.lua  # Markdown language server
│   │   ├── marksman.lua        # Markdown (Marksman) server
│   │   ├── pylsp.lua           # Python language server
│   │   ├── rust_analyzer.lua   # Rust language server
│   │   └── ts_ls.lua           # TypeScript language server
│   └── plugins/                # Plugin configurations
│       ├── ui/                 # UI & appearance plugins
│       │   ├── colortheme.lua  # Color scheme configuration
│       │   ├── lualine.lua     # Status line
│       │   ├── noice.lua       # Enhanced UI notifications
│       │   ├── snacks.lua      # Snacks.nvim utilities
│       │   ├── snacks-keymaps.lua # Snacks keymappings
│       │   └── which-key.lua   # Key mapping help
│       ├── editor/             # Editor enhancement plugins
│       │   ├── autopairs.lua   # Auto-pair brackets/quotes
│       │   ├── blink.lua       # Completion engine
│       │   ├── comment.lua     # Smart commenting
│       │   ├── treesitter.lua  # Syntax highlighting
│       │   └── trouble.lua     # Diagnostics panel
│       ├── lsp/                # LSP & development tools
│       │   ├── conform.lua     # Code formatting
│       │   └── mason.lua       # LSP server manager
│       ├── git/                # Git integration plugins
│       │   └── gitsigns.lua    # Git signs and hunks
│       ├── integration/        # External tool integrations
│       │   ├── tmux.lua        # Tmux integration
│       │   └── zk.lua          # Zettelkasten notes
│       └── ai/                 # AI assistance plugins
│           ├── avante.lua      # AI coding assistant
│           ├── copilot.lua     # GitHub Copilot
│           ├── gemini.lua      # Google Gemini AI
│           └── supermaven.lua  # Supermaven AI
├── AGENTS.md                   # Guidelines for AI coding agents
├── lazy-lock.json              # Plugin version lockfile
└── readme.md                   # This file
```

## 🚀 Features

- **Modern Plugin Management**: Using lazy.nvim for fast startup times and efficient loading
- **Organized Structure**: Plugins categorized by functionality with clear separation
- **Comprehensive LSP Support**: Language servers for 10+ languages including TypeScript, Python, Rust, HTML, CSS, and more
- **Advanced Completion**: Blink.nvim for fast and intelligent code completion
- **Git Integration**: GitSigns for inline git information and status
- **Multiple AI Assistants**: GitHub Copilot, Avante, Supermaven, and Google Gemini integration
- **Enhanced UI**: Snacks.nvim for file management, Noice for notifications, Which-Key for keybinding help
- **Smart Editing**: TreeSitter syntax highlighting, auto-pairs, smart commenting, and Trouble diagnostics
- **External Integration**: Tmux navigation and Zettelkasten note-taking support
- **Code Formatting**: Conform.nvim for consistent code formatting across languages

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

### Core Mappings
- `<Space>` - Leader key
- `<leader>v` - Split window vertically
- `<leader>s` - Split window horizontally
- `<leader>rn` - Toggle relative line numbers
- `<leader>n` - Toggle line numbers

### Tab Management
- `<leader>to` - Create a new tab
- `<leader>tx` - Close current tab

### LSP Management
- `<leader>qL` - Detach LSP from current buffer

*Note: Additional keymappings are defined within individual plugins. Use `<leader>` + Which-Key to explore available shortcuts.*

## 🔧 Customization

Edit the respective files in `lua/` to customize:
- `core/options.lua` - Vim settings
- `core/keymaps.lua` - Key mappings  
- `plugins/*/` - Plugin configurations

## 📝 Contributing

Feel free to submit issues and enhancement requests!
