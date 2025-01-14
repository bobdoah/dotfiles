return {
  'tpope/vim-fugitive',
  version = '*',
  keys = {
    { '<leader>gs', '<cmd>Git<cr>', desc = 'Git Status' },
    { '<leader>gp', '<cmd>Git push<cr>', desc = 'Git Push' },
    { '<leader>gfp', '<cmd>Git push --force<cr>', desc = 'Git Force Push' },
    { '<leader>gmp', '<cmd>Git push -o merge_request.create=true<cr>', desc = 'Git Push and open Merge Request' },
  },
}
