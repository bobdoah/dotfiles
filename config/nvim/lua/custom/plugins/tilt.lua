vim.api.nvim_create_autocmd('BufRead', {
  pattern = 'Tiltfile',
  callback = function()
    vim.bo.filetype = 'tiltfile'
  end,
})
vim.lsp.enable 'tilt_ls'
vim.treesitter.language.register('starlark', 'tiltfile')
return {}
