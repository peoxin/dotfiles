local opt = vim.opt

-- Encoding
opt.fileencoding = "utf-8"

-- Backup
opt.backup = false
opt.swapfile = false
opt.undofile = false
opt.writebackup = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- View
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = true
opt.showmatch = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.mouse = "a"
opt.showmode = false
opt.numberwidth = 4
opt.signcolumn = "yes"

-- Split
opt.splitbelow = true
opt.splitright = true

-- Appearance
opt.background = "dark"
opt.termguicolors = true

-- Others
opt.autochdir = false
opt.clipboard:append("unnamedplus") -- need to install xclip
opt.iskeyword:append("-")
