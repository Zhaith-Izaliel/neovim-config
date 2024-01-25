local capabilities = require('lsp.utils').capabilities
local is_npm_package_installed = require('utils').is_npm_package_installed

local function get_filetypes()
  if is_npm_package_installed('tailwindcss') then
    return {
      "astro",
      "astro-markdown",
      "django-html",
      "htmldjango",
      "edge",
      "eelixir",
      "elixir",
      "ejs",
      "erb",
      "eruby",
      "gohtml",
      "gohtmltmpl",
      "haml",
      "handlebars",
      "hbs",
      "html",
      "html-eex",
      "markdown",
      "mdx",
      "css",
      "less",
      "postcss",
      "sass",
      "scss",
      "stylus",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "svelte"
    }
  end
  return {}
end

require('lspconfig').tailwindcss.setup {
  capabilities = capabilities,
  filetypes = get_filetypes(),
} -- TailwindCSS
