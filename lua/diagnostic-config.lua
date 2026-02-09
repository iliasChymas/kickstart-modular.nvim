-- Shared diagnostic configuration
local M = {}

M.error_icons = vim.g.have_nerd_font and {
  [vim.diagnostic.severity.ERROR] = '󰅚 ',
  [vim.diagnostic.severity.WARN] = '󰀪 ',
  [vim.diagnostic.severity.INFO] = '󰋽 ',
  [vim.diagnostic.severity.HINT] = '󰌶 ',
} or {}

M.base_config = {
  severity_sort = true,
  virtual_text = false,
  float = { border = 'rounded', source = 'if_many' },
}

function M.get_config(errors_only)
  return vim.tbl_deep_extend('force', M.base_config, {
    underline = errors_only and { severity = vim.diagnostic.severity.ERROR } or true,
    signs = errors_only and {
      severity = vim.diagnostic.severity.ERROR,
      text = M.error_icons,
    } or {
      text = M.error_icons,
    },
  })
end

return M
