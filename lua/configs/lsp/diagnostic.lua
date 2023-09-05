local M = {}

function M.config()
  local sign = function (opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = '',
    })
  end

  sign({ name = 'DiagnosticSignError', text = '✘' })
  sign({ name = 'DiagnosticSignWarn', text = '▲' })
  sign({ name = 'DiagnosticSignHint', text = '⚑' })
  sign({ name = 'DiagnosticSignInfo', text = '' })

  vim.diagnostic.config({
    virtual_text = false,
    --virtual_text = true,
    severity_sort = true,
    signs = true,
    update_in_insert = false,
    underline = false,
    float = {
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })
end

return M
