local M = {}

function M.config()
vim.cmd([[
let g:ascii = [
\ '__      _______ __  __ ',
\ '\ \    / /_   _|  \/  |',
\ ' \ \  / /  | | | \  / |',
\ '  \ \/ /   | | | |\/| |',
\ '   \  /   _| |_| |  | |',
\ '    \/   |_____|_|  |_|',
\ '                       ',
\ '                       '
\ ]
let g:startify_custom_header_quotes = []
let g:startify_custom_header = startify#center(g:ascii)
]])
end

return M
