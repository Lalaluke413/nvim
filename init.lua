-- setup vim defaults
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir";
vim.opt.undofile = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"


-- setup vim keybindings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


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
    {'hrsh7th/cmp-buffer'},
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
    {'uga-rosa/cmp-dictionary'},
    {'onsails/lspkind.nvim'}, -- formatting in autocomplete menu
})

-- apply colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

-- setup autocomplete (cmp)
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local cmp = require('cmp')

-- for tab autocomplete
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


cmp.setup({
   
    -- autocomplete keybindings
    mapping = {

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    -- sources to autocomplete from
    sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "dictionary", keyword_length = 2 },
        { name = "buffer", keyword_length = 4 },
    }),

    -- formatting in autocomplete menu
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                luasnip = "[snip]",
                dictionary = "[dict]",
            },
        },
    },

    -- snippet engine...?
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})

-- setup dictionary for autocomplete
local dict = require("cmp_dictionary")

dict.switcher({
    spelllang = {
        en = "./en.dict",
    },
})

vim.cmd.set('spelllang=en')

