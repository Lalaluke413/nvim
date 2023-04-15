require('user')

-- lazy.vim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- install plugins

    {'folke/tokyonight.nvim'}, -- colorscheme

    -- treesitter
    {'nvim-treesitter/nvim-treesitter'},

    -- telescope (fuzzy finder)
    {'nvim-lua/plenary.nvim'}, -- dependancy
    {'BurntSushi/ripgrep'}, -- OMG I LOVE RUST
    {'nvim-telescope/telescope.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {'tzachar/fuzzy.nvim', dependencies = {'nvim-telescope/telescope-fzf-native.nvim'}},
    
    -- autocomplete (coq)
    {'ms-jpq/coq_nvim', branch='coq'},
    {'ms-jpq/coq.artifacts', branch='artifacts'},
    {'ms-jpq/coq.thirdparty', branch='3p'},

    -- LSP
    {'williamboman/mason.nvim', build=':MasonUpdate'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},

    -- status line
    {'nvim-lualine/lualine.nvim'},
    {'nvim-tree/nvim-web-devicons'},
    
    -- tmux navigation
    {'christoomey/vim-tmux-navigator'},
})
