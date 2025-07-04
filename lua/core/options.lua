-- Enable line numbers
vim.wo.number = true

-- Enable relative line numbers
vim.o.relativenumber = true

-- Enable text wrapping
vim.o.wrap = true

-- Disable line break at word boundaries when wrapping
vim.o.linebreak = false

-- Enable mouse support
vim.o.mouse = ""

-- Enable automatic indentation
vim.o.autoindent = true

-- Ignore case in search patterns
vim.o.ignorecase = true

-- Override 'ignorecase' if search pattern contains upper case letters
vim.o.smartcase = true

-- Set the number of spaces to use for each step of autoindent
vim.o.shiftwidth = 4

-- Set the number of spaces for a hard tab
vim.o.tabstop = 4

-- Set the number of spaces for a soft tab
vim.o.softtabstop = 4

-- Convert tabs to spaces
vim.o.expandtab = true

-- Minimum number of screen lines to keep above and below the cursor
vim.o.scrolloff = 4

-- Highlight the current line
vim.o.cursorline = true

-- Open new splits below the current window
vim.o.splitbelow = true

-- Open new splits to the right of the current window
vim.o.splitright = true

-- Disable search highlight
vim.o.hlsearch = false

-- Disable mode display in the command line
vim.o.showmode = false

-- Enable 24-bit RGB color in the terminal UI
vim.opt.termguicolors = true

-- Disable swap files
vim.o.swapfile = false

-- Enable undo files
vim.o.undofile = true

-- Customize completion options
vim.o.completeopt = "menuone,noselect"

-- Enable wrapping for certain keys
vim.o.whichwrap = "bs<>[]hl"

-- Set the width of the line number column
vim.o.numberwidth = 4

-- Enable smart indentation
vim.o.smartindent = true

-- Reduce delay for triggering CursorHold events
vim.o.updatetime = 250

-- Set global status line
vim.o.laststatus = 3

-- Disable tab line display
vim.o.showtabline = 0
