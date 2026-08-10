local ai = require 'custom.ai'

return {
  {
    'folke/sidekick.nvim',
    enabled = ai.enabled 'claude' or ai.enabled 'copilot' or ai.enabled 'opencode',
    opts = {
      cli = {
        mux = {
          backend = vim.env.ZELLIJ and 'zellij' or 'tmux',
          enabled = true,
        },
        tools = {
          claude = ai.enabled 'claude' and {} or nil,
          copilot = ai.enabled 'copilot' and {} or nil,
          opencode = ai.enabled 'opencode' and {} or nil,
        },
      },
    },
    keys = {
      { '<tab>', function() require('sidekick').nes_jump_or_apply() end, mode = 'n', desc = 'AI: Apply Next Edit' },
      { '<c-.>', function() require('sidekick.cli').focus() end, mode = { 'n', 'i', 't' }, desc = 'AI: Focus CLI' },
      { '<leader>aa', function() require('sidekick.cli').toggle() end, desc = 'AI: Toggle CLI' },
      { '<leader>as', function() require('sidekick.cli').select() end, desc = 'AI: Select CLI Tool' },
      { '<leader>ac', function() require('sidekick.cli').toggle { name = 'claude', focus = true } end, desc = 'AI: Toggle Claude' },
      { '<leader>ag', function() require('sidekick.cli').toggle { name = 'copilot', focus = true } end, desc = 'AI: Toggle Copilot CLI' },
      { '<leader>ao', function() require('sidekick.cli').toggle { name = 'opencode', focus = true } end, desc = 'AI: Toggle OpenCode' },
    },
  },
}
