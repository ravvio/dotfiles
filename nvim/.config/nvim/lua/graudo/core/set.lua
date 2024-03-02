-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Smart indentation and wrapping
vim.opt.smartindent = true
vim.opt.wrap = false

-- Udo and swapping
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = false
-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- How certain whitespace will be shown
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Colors
vim.opt.termguicolors = true

-- Scrolling
vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"
