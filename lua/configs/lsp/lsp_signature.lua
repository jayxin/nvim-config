local M = {}

function M.config()
  cfg = {
    debug = false,
    log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
    verbose = false,
    bind = true,
    doc_lines = 10,
    max_height = 12,
    max_width = 80,
    noice = false,
    wrap = true,
    floating_window = true,
    floating_window_above_cur_line = true,
    floating_window_off_x = 1,
    floating_window_off_y = 0,
    close_timeout = 4000,
    fix_pos = false,
    hint_enable = true,
    --hint_prefix = "🐼 ",                      -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
    --hint_prefix = "🐧 ",
    --hint_prefix = "🦔 ",
    hint_prefix = "🦫 ",
    hint_scheme = "String",
    hi_parameter = "LspSignatureActiveParameter",
    handler_opts = {
      border = "rounded",
    },
    always_trigger = false,
    auto_close_after = nil,
    extra_trigger_chars = {},
    zindex = 200,
    padding = "",
    transparency = nil,
    shadow_blend = 36,
    shadow_guibg = "Black",
    timer_interval = 200,
    toggle_key = nil,
    select_signature_key = nil,
    move_cursor_key = nil,
  }

  require('lsp_signature').setup(cfg)
end

return M
