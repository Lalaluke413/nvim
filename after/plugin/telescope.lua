
-- setup telescope
require("telescope").setup {
    pickers = {
        find_files = {
            mappings =  {
                i = {
                    ["<Tab>"] = require('telescope.actions').move_selection_previous, -- Tab doesn't select items
                    ["<S-Tab>"] = require('telescope.actions').move_selection_next,
                    ["<Esc>"] = require('telescope.actions').close, -- Esc closes telescope in insert mode
                },
                n = { 
                    ["<Tab>"] = require('telescope.actions').move_selection_previous,
                    ["<S-Tab>"] = require('telescope.actions').move_selection_next,
                },
            },
        },
        live_grep = {
            mappings =  {
                i = {
                    ["<Tab>"] = require('telescope.actions').move_selection_previous,
                    ["<S-Tab>"] = require('telescope.actions').move_selection_next,
                    ["<Esc>"] = require('telescope.actions').close,
                },
                n = { 
                    ["<Tab>"] = require('telescope.actions').move_selection_previous,
                    ["<S-Tab>"] = require('telescope.actions').move_selection_next,
                },
            },
        },
        buffers = {
            mappings =  {
                i = {
                    ["<Tab>"] = require('telescope.actions').move_selection_previous,
                    ["<S-Tab>"] = require('telescope.actions').move_selection_next,
                    ["<Esc>"] = require('telescope.actions').close,
                },
                n = { 
                    ["<Tab>"] = require('telescope.actions').move_selection_previous,
                    ["<S-Tab>"] = require('telescope.actions').move_selection_next,
                },
            },
        }
    },
}

-- telescope bindings
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- find files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- find text
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- find buffers
