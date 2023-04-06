local opt = vim.opt

-- Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Line number
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.signcolumn = "yes"

-- View
opt.cursorline = true
opt.wrap = true
opt.showmatch = true

-- Split window
opt.splitbelow = true
opt.splitright = true

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 8

-- File encoding
opt.fileencoding = "utf-8"

-- File backup
opt.backup = false
opt.swapfile = false
opt.undofile = false
opt.writebackup = false

-- Appearance
opt.showmode = false
opt.background = "dark"
opt.termguicolors = true

-- Others
opt.autochdir = false
opt.mouse = "a"
opt.clipboard:append("unnamedplus") -- need to install xclip or other clipboard tools
opt.iskeyword:append("-")
