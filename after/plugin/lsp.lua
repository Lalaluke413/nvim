require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "rust_analyzer",
    "tsserver",
    "html",
    "cssls",
    "lua_ls",
  }
})

require("lspsaga").setup({})

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")


local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- go to implementation
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["rust_analyzer"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
