local capabilities = require('lsp.utils').capabilities
local is_npm_package_installed = require('utils').is_npm_package_installed

local function get_filetypes()
  local filetypes = { 'vue' }
  if is_npm_package_installed('vue') then
    table.insert(filetypes, 'javascript')
  end

  if is_npm_package_installed 'typescript' then
    table.insert(filetypes, 'typescript')
  end
  return filetypes
end

require('lspconfig').volar.setup {
  capabilities = capabilities,
  filetypes = get_filetypes(),
}
