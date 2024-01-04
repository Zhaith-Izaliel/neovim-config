local capabilities = require('lsp.utils').capabilities
local is_npm_package_installed = require('utils').is_npm_package_installed

local get_filetypes = function()
  local filetypes = { 'vue' }
  if is_npm_package_installed('vue') then
    table.insert(filetypes, 'javascript')
  end

  if is_npm_package_installed 'typescript' then
    table.insert(filetypes, 'typescript')
  end
end

require('lspconfig').volar.setup {
  capabilities = capabilities,
  -- https://github.com/johnsoncodehk/volar
  filetypes = get_filetypes(),
}
