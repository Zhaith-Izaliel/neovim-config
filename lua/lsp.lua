-- -----------------------
-- ---LSP Configuration---
-- -----------------------

-- Utils contains nvim-api keymap functions
local Utils = require('utils')

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local noremap = Utils.noremap

-- Change LSP Signs
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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

-- ---Server Configurations---

-- Setup language servers.
local lspconfig = require('lspconfig')

-- Rust
-- Helpers for rust-tools
local function ensure_uri_scheme(uri)
    if not vim.startswith(uri, 'file://') then
        return 'file://' .. uri
    end
    return uri
end

local function is_in_workspace(uri)
    uri = ensure_uri_scheme(uri)
    local path = vim.uri_to_fname(uri)
    local workspace_dir = vim.fn.getcwd()

    return vim.startswith(path, workspace_dir)
end

local function filter_diagnostics(diagnostics)
    local filtered_diagnostics = {}
    for _, diagnostic in ipairs(diagnostics) do
        if is_in_workspace(diagnostic.source) then
            table.insert(filtered_diagnostics, diagnostic)
        end
    end
    return filtered_diagnostics
end


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
    server = {
      handlers = {
        ['textDocument/publishDiagnostics'] =
          function(err, method, result, client_id, bufnr, config)
            if not result or not result.uri then
              return
            end

            local uri = result.uri
            local bufnr = vim.uri_to_bufnr(uri)

            if not bufnr then
              return
            end

            if is_in_workspace(uri) then
              local diagnostics = vim.lsp.diagnostic.to_severity(result.diagnostics)
              diagnostics = filter_diagnostics(diagnostics)
              vim.lsp.diagnostic.save(diagnostics, bufnr, client_id)
              if vim.api.nvim_buf_is_loaded(bufnr) then
                vim.lsp.diagnostic.set_signs(diagnostics, bufnr, client_id)
              end
            end
          end
        ,
      },
    }
  },
})

-- Go
require('go').setup {}

-- Typescript
require('typescript-tools').setup {}

lspconfig.lua_ls.setup { -- Lua
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
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.pyright.setup {} -- Python

lspconfig.nil_ls.setup {} -- Nix

lspconfig.eslint.setup { -- JS/TS
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',
    })
  end,
}

lspconfig.html.setup {} -- HTML

lspconfig.stylelint_lsp.setup { -- CSS/SCSS/Less
  settings = {
    stylelintplus = {
      -- Config to remove warnings for tailwindcss
      config = {
        ['at-rule-no-unknown'] = {
          true,
          {
            ignoreAtRules = {
              'apply',
              'layer',
              'responsive',
              'screen',
              'tailwind',
              'variants',
            },
          },
        },
        ['declaration-block-trailing-semicolon'] = 'null',
        ['no-descending-specificity'] = 'null',
      }
    }
  },
  root_dir = lspconfig.util.root_pattern('.git'),
}

-- lspconfig.tailwindcss.setup {} -- TailwindCSS

lspconfig.jsonls.setup {}

lspconfig.vuels.setup {} -- Vue

lspconfig.ccls.setup {} -- C/C++

lspconfig.cmake.setup {} -- CMake

lspconfig.gopls.setup {} -- Go

lspconfig.omnisharp.setup {
  cmd = { 'dotnet', omnisharp_path },
}

lspconfig.ltex.setup {
  settings = {
    ltex = {
      language = 'en-US',
    },
  },
}

-------------
---Trouble---
-------------

require('trouble').setup {
  use_diagnostic_signs = false,
  mode = 'workspace_diagnostics',
  fold_open = '', -- icon used for open folds
  fold_closed = '', -- icon used for closed folds
  signs = {
      -- icons / text used for a diagnostic
      error = '',
      warning = '',
      hint = '',
      information = '',
      other = '',
    },
}

nnoremap('<leader>xx', '<cmd>TroubleToggle<cr>', 'Trouble: toggle.')
nnoremap('<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>',
  'Trouble: toggle workspace diagnostics' )
nnoremap('<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>',
  'Trouble: toggle document diagnostics')
nnoremap('<leader>xq', '<cmd>TroubleToggle quickfix<cr>',
  'Trouble: quickfix.' )
nnoremap('<leader>xl', '<cmd>TroubleToggle loclist<cr>',
  'Trouble: toggle loclist')
nnoremap('gR', '<cmd>TroubleToggle lsp_references<cr>',
  'Trouble: get references of symbol under cursor.' )

