vim.opt.path:append({
  os.getenv("HOME") .. "/.config/nvim/*/**",
})
require("core/init")
