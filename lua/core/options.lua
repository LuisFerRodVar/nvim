-- ============================================================================
-- Neovim Core Options Configuration
-- ============================================================================

-- ============================================================================
-- Line Numbers & Display
-- ============================================================================

vim.o.number = true                -- Show absolute line numbers
vim.o.relativenumber = true        -- Show relative line numbers
vim.o.numberwidth = 4              -- Width of line number column
vim.o.cursorline = false           -- Disable current line highlighting

-- ============================================================================
-- Text Formatting & Indentation
-- ============================================================================

vim.o.expandtab = true             -- Convert tabs to spaces
vim.o.tabstop = 4                  -- Number of spaces for hard tab
vim.o.softtabstop = 4              -- Number of spaces for soft tab
vim.o.shiftwidth = 4               -- Number of spaces for autoindent
vim.o.autoindent = true            -- Enable automatic indentation
vim.o.smartindent = true           -- Enable smart indentation

-- ============================================================================
-- Text Wrapping
-- ============================================================================

vim.o.wrap = true                  -- Enable text wrapping
vim.o.linebreak = false            -- Disable line break at word boundaries
vim.o.whichwrap = "bs<>[]hl"       -- Allow cursor movement across lines

-- ============================================================================
-- Search Settings
-- ============================================================================

vim.o.ignorecase = true            -- Ignore case in search patterns
vim.o.smartcase = true             -- Override ignorecase if pattern has uppercase
vim.o.hlsearch = false             -- Disable search highlighting

-- ============================================================================
-- User Interface
-- ============================================================================

vim.o.mouse = ""                   -- Disable mouse support
vim.o.showmode = false             -- Disable mode display in command line
vim.o.termguicolors = true         -- Enable 24-bit RGB colors
vim.o.scrolloff = 4                -- Minimum lines above/below cursor
vim.o.laststatus = 3               -- Global status line
vim.o.showtabline = 0              -- Disable tab line display

-- ============================================================================
-- Window Splits
-- ============================================================================

vim.o.splitbelow = true            -- Open horizontal splits below
vim.o.splitright = true            -- Open vertical splits to the right

-- ============================================================================
-- File Management
-- ============================================================================

vim.o.swapfile = false             -- Disable swap files
vim.o.undofile = true              -- Enable persistent undo

-- ============================================================================
-- Completion
-- ============================================================================

vim.o.completeopt = "menuone,noselect"  -- Completion menu options

-- ============================================================================
-- Performance
-- ============================================================================

vim.o.updatetime = 250             -- Faster CursorHold events
