require('my_settings')

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

    -- autocomplete
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-nvim-lsp'},

    {'tzachar/cmp-fuzzy-buffer', dependencies = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}},

    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
    {'onsails/lspkind.nvim'}, -- formatting in autocomplete menu

    -- treesitter
    {'nvim-treesitter/nvim-treesitter'},

    -- telescope (fuzzy finder)
    {'nvim-lua/plenary.nvim'}, -- dependancy
    {'BurntSushi/ripgrep'}, -- OMG I LOVE RUST
    {'nvim-telescope/telescope.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {'tzachar/fuzzy.nvim', dependencies = {'nvim-telescope/telescope-fzf-native.nvim'}},
})
