M = {}

M.map = function(mode, lhs, rhs, desc)
  local opts = {
    noremap = true,
    silent = true,
    desc = desc,
  }
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
