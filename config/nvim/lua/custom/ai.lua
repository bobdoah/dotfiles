-- Central place for "which AI tools are active on this machine".
--
-- Location (work/home) and per-tool toggles are read from an untracked
-- lua/custom/ai_local.lua (see ai_local.lua.example), mirroring the
-- zsh/private convention used elsewhere in these dotfiles for
-- machine-specific settings that shouldn't be committed. Falls back to
-- 'home' defaults when no local file exists.

local M = {}

local defaults = {
  work = { claude = true, copilot = true, opencode = false },
  home = { claude = true, copilot = false, opencode = true },
}

local ok, local_config = pcall(require, 'custom.ai_local')
if not ok then
  local_config = {}
end

M.location = local_config.location or 'home'
M.tools = vim.tbl_deep_extend('force', defaults[M.location] or defaults.home, local_config.tools or {})

--- Whether the given tool (e.g. 'claude', 'copilot', 'opencode') should be active.
---@param tool string
function M.enabled(tool)
  return vim.g.enable_ai ~= false and M.tools[tool] == true
end

vim.api.nvim_create_user_command('AiStatus', function()
  local lines = {
    'location: ' .. M.location,
    'enable_ai: ' .. tostring(vim.g.enable_ai ~= false),
  }
  for tool, enabled in pairs(M.tools) do
    table.insert(lines, string.format('  %s: %s', tool, tostring(enabled)))
  end
  vim.notify(table.concat(lines, '\n'), vim.log.levels.INFO, { title = 'AI tools' })
end, {})

vim.api.nvim_create_user_command('AiToggle', function(opts)
  local tool = opts.args
  if M.tools[tool] == nil then
    vim.notify('Unknown AI tool: ' .. tool, vim.log.levels.ERROR)
    return
  end
  M.tools[tool] = not M.tools[tool]
  vim.notify(string.format('%s %s (restart or :Lazy reload to apply)', tool, M.tools[tool] and 'enabled' or 'disabled'))
end, {
  nargs = 1,
  complete = function()
    return vim.tbl_keys(M.tools)
  end,
})

return M
