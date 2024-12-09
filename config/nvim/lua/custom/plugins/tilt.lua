vim.api.nvim_create_autocmd('BufRead', {
  pattern = 'Tiltfile',
  callback = function()
    vim.bo.filetype = 'tiltfile'
  end,
})
require('lspconfig').tilt_ls.setup {}
vim.treesitter.language.register('starlark', 'tiltfile')
return {}
