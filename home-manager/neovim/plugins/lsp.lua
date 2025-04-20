local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(4),
    ['<C-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true })
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'buffer' }
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig')['clangd'].setup {
  capabilities = capabilities
}
require('lspconfig')['lua_ls'].setup {
  capabilities = capabilities
}
require('lspconfig')['hls'].setup {
  capabilities = capabilities
}
require('lspconfig')['nil_ls'].setup {
  capabilities = capabilities
}
require('lspconfig')['ts_ls'].setup {
  capabilities = capabilities
}
-- next 3 provided by vscode ls extracted
require('lspconfig')['html'].setup {
  capabilities = capabilities
}
require('lspconfig')['jsonls'].setup {
  capabilities = capabilities
}
require('lspconfig')['cssls'].setup {
  capabilities = capabilities
}
