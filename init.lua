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

    -- autocomplete (cmp) and sources
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},

    -- snippets
    {'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp'},
    {'saadparwaiz1/cmp_luasnip'},

    -- LSP
    {'williamboman/mason.nvim', build=':MasonUpdate'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'glepnir/lspsaga.nvim', branch = 'main', event = 'LspAttach', dependencies = {{'nvim-tree/nvim-web-devicons'}, {'nvim-treesitter/nvim-treesitter'}}},
    {'onsails/lspkind.nvim'},

    -- status line
    {'nvim-lualine/lualine.nvim'},
    {'nvim-tree/nvim-web-devicons'},

    -- tmux navigation
    {'christoomey/vim-tmux-navigator'},

    -- commenting with gc
    {'numToStr/Comment.nvim'},

    -- transparent
    {'xiyaowong/transparent.nvim'},
})
