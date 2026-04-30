return {
  {
    'olimorris/codecompanion.nvim',
    enabled = vim.g.enable_ai and vim.g.code_companion_enabled,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'copilot',
        },
      },
      opts = {
        log_level = 'DEBUG', -- or "TRACE"
      },
    },
  },
}
