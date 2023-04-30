-- -----------------------
-- ---LSP Configuration---
-- -----------------------

-- Utils contains nvim-api keymap functions
local Utils = require('utils')

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local noremap = Utils.noremap


-- Setup language servers.
local lspconfig = require('lspconfig')
-- DEPRECATED: will have to move to `lua_ls` when nixpkgs updates lsp-config.
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    nnoremap('gD', vim.lsp.buf.declaration, 'LSP: Go to declaration.', opts)
    nnoremap('gd', vim.lsp.buf.definition, 'LSP: Go to definition.', opts)
    nnoremap('K', vim.lsp.buf.hover, 'LSP: Displays hover information about the symbol under the cursor in a floating window. Calling the function twice will jump into the floating window.', opts)
    nnoremap('gi', vim.lsp.buf.implementation, 'LSP: Go to implementation.', opts)
    nnoremap('<C-k>', vim.lsp.buf.signature_help, 'LSP: Displays signature information about the symbol under the cursor in a floating window.', opts)
    nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, 'LSP: Add another project root (workspace) to work in, in the current session.', opts)
    nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, 'LSP: Remove a workspace from the current session.', opts)
    nnoremap('<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, 'LSP: List workspaces.', opts)
    nnoremap('<space>D', vim.lsp.buf.type_definition, 'LSP: Go to type definition.', opts)
    nnoremap('<space>rn', vim.lsp.buf.rename, 'LSP: Rename the token under the cursor.', opts)
    noremap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, 'LSP: Select a code action available at the current cursor position.', opts)
    nnoremap('gr', vim.lsp.buf.references, 'LSP: Get references of the token under the cursor.', opts)
    nnoremap('<space>f', function()
      vim.lsp.buf.format { async = true }
    end, 'LSP: Format buffer.', opts)
  end,
})

-- ---Other plugins using LSP and working as LSP---

-- Rust Tools
-- TODO: add description for keymap
local rt = require('rust-tools')
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      nnoremap('<Leader>rt', rt.hover_actions.hover_actions, '', { buffer = bufnr })
      -- Code action groups
      nnoremap('<Leader>a', rt.code_action_group.code_action_group, '', { buffer = bufnr })
    end,
  },
})
