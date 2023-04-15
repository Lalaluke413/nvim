
-- setup vim defaults
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoindent = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir";
vim.opt.undofile = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"

vim.opt.termguicolors = true

-- backspace
vim.opt.backspace = "indent,eol,start"

-- make "-" part of words
vim.opt.iskeyword:append("-")


