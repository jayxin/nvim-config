require('configs/vim-markdown').config()
require('configs/markdown-preview').config()
--require('configs/vim-markdown-toc').config()

--vim.cmd [[
--setlocal nowrap linebreak nolist textwidth=0 wrapmargin=0
--]]
vim.cmd [[
  setlocal nowrap tw=0
]]
