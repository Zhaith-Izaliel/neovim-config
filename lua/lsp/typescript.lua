local capabilities = require('lsp.utils').capabilities
local is_npm_package_installed = require('utils').is_npm_package_installed

local get_tsserver_filetypes = function()
  if is_npm_package_installed 'vue' then
    return {
      'javascriptreact',
      'javascript.jsx',
      'typescriptreact',
      'typescript.tsx'
    }
  end
  if is_npm_package_installed 'typescript' then
    return {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx'
    }
  end

  return {
    'typescript',
    'typescriptreact',
    'typescript.tsx'
  }
end

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('TypescriptToolsBufFormatting', {}),
  pattern = {
    '*.ts',
    '*.js',
    '*.jsx',
    '*.tsx',
  },
  callback = function()
    vim.lsp.buf.format {
      filter = function(client) return client.name ~= 'typescript-tools' end
    }
  end,
})

-- Typescript
require('typescript-tools').setup {
  capabilities = capabilities,
  filetypes = get_tsserver_filetypes(),
}

