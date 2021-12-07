-- autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>

require'lspconfig'.eslint.setup{
  -- on_attach = require('lsp').on_attach,
}
  -- capabilities = require('coq').capabilities,

-- require'lspconfig'.eslint.setup(require "coq".lsp_ensure_capabilities())

