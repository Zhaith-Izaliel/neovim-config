local capabilities = require('lsp.utils').capabilities
local is_npm_package_installed = require('utils').is_npm_package_installed

local get_filetypes = function()
  local filetypes = { 'vue' }
  if is_npm_package_installed('vue') then
    table.insert(filetypes, 1, 'javascript')
  end

  if is_npm_package_installed 'typescript' then
    table.insert(filetypes, 1, 'typescript')
  end
  return filetypes
end

require('lspconfig').volar.setup {
  capabilities = capabilities,
  filetypes = get_filetypes(),
}
