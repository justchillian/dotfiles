return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          extra_args = { '--single-quote', '--jsx-single-quote', '--no-semi' },
          filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
        }),
        null_ls.builtins.formatting.stylua,
      },
    })
  end,
},
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.lua' },
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
