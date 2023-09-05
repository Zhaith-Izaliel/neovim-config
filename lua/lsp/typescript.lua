local capabilities = require('cmp_nvim_lsp').default_capabilities()
local is_npm_package_installed = require('utils').is_npm_package_installed

-- Typescript
require('typescript-tools').setup {
  capabilities = capabilities,
  filetypes = is_npm_package_installed 'vue'
    and {
      "javascriptreact",
      "javascript.jsx",
      "typescriptreact",
      "typescript.tsx"
    }
    or {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx"
    }
  ,
}

