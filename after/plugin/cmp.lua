local cmp = require('cmp')
local luasnip = require('luasnip')

-- load friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = { -- default
    ['<C-n>'] = {
      i = function()
        if cmp.visible() then
          cmp.select_next_item()
        else
          cmp.complete()
        end
      end,
    },
    ['<C-p>'] = {
      i = function()
        if cmp.visible() then
          cmp.select_prev_item()
        else
          cmp.complete()
        end
      end,
    },
    ['<C-y>'] = cmp.mapping.confirm({ select = false }),
    ['<C-e>'] = cmp.mapping.abort(),
  },

  sources = cmp.config.sources({
    {name = "nvim_lsp"}, -- LSP
    {name = "luasnip"}, -- snippets
    {name = "buffer"}, -- text within current buffer
    {name = "path"}, -- file system paths
  }),

  formatting = {
    format = require("lspkind").cmp_format({
      max_width = 50,
      ellipsis_char = "...",
    }),
  },
})

