local opts = { noremap  = true, silent = true }
local l    = "<Leader>"

-- Set leader
vim.g.mapleader      = ","
--vim.g.maplocalleader = ','

-- i:jk;t:jk;n:<Space>,s,<Leader><Cr> {{{
vim.keymap.set("i", "jk"       , "<Esc>"      , opts)
vim.keymap.set("n", "<Space>"  , ":"          , { noremap = true })
vim.keymap.set("" , "s"        , "<Nop>"      , opts)
vim.keymap.set("" , "S"        , "<Nop>"      , opts)
vim.keymap.set("n", l .. "<Cr>", ":noh<Cr>"   , opts)
vim.keymap.set("t", "jk"       , "<C-\\><C-n>", opts)
-- }}}

-- :e $MYVIMRC {{{
vim.keymap.set("n", l .. "erc", ":e $MYVIMRC<Cr>", opts)
vim.keymap.set("n", l .. "src", ":so %<Cr>"      , opts)
-- }}}

-- n:H,J,K,L,dH,dL,<C-f>,<C-b> {{{
vim.keymap.set("n", "J"    , "6jzz" , opts)
vim.keymap.set("n", "K"    , "6kzz" , opts)
vim.keymap.set("n", "H"    , "0"    , opts)
vim.keymap.set("n", "L"    , "g_"   , opts)
--vim.keymap.set('n', '<C-f>', '10jzz', opts)
--vim.keymap.set('n', '<C-b>', '10kzz', opts)
--}}}

-- n:Q,<Leader>";v:Y,p {{{
vim.keymap.set("n", "Q", ":q!<Cr>", opts)

vim.keymap.set("v", "Y", '"+y', opts)

-- Replace what you highlight
vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("v", '<Leader>"', 'di""<Esc>P'   , opts)
vim.keymap.set("v", "<Leader>'", "di''<Esc>P"   , opts)
vim.keymap.set("v", "<Leader>`", "di``<Esc>P"   , opts)
vim.keymap.set("v", "<Leader>|", "di|  |<Esc>hP", opts)

vim.keymap.set("v", "<Leader>{", "di{}<Esc>P", opts)
vim.keymap.set("v", "<Leader>[", "di[]<Esc>P", opts)
vim.keymap.set("v", "<Leader>(", "di()<Esc>P", opts)
vim.keymap.set("v", "<Leader><", "di<><Esc>P", opts)
-- }}}

-- n:<Leader>sc,<Leader>sw;c:w!! {{{
--vim.keymap.set('n', l..'sc'  , ':set spell!<Cr>'         , opts)
vim.keymap.set("n", l .. "sw", ":set wrap!<Cr>"          , opts)
--vim.keymap.set('c', 'w!!'    , 'w !sudo tee >/dev/null %', opts)
-- }}}

-- Indent {{{
vim.keymap.set("n", "<", "<<", opts)
vim.keymap.set("n", ">", ">>", opts)

-- Stay in indent mode when you indent code
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
-- }}}

-- Move line up and down {{{
vim.keymap.set("n", "mj", ":move .+1<Cr>==" , opts)
vim.keymap.set("n", "mk", ":move .-2<Cr>==" , opts)
vim.keymap.set("v", "mj", ":m '>+1<Cr>gv=gv", opts)
vim.keymap.set("v", "mk", ":m '<-2<Cr>gv=gv", opts)
-- }}}

-- Windows {{{
-- Split screen {{{
vim.keymap.set("n", l .. "wsk", ":set nosb<Cr>:sp<Cr>:set sb<Cr>"   , opts)
vim.keymap.set("n", l .. "wsh", ":set nospr<Cr>:vsp<Cr>:set spr<Cr>", opts)
vim.keymap.set("n", l .. "wsj", ":set sb<Cr>:sp<Cr>"                , opts)
vim.keymap.set("n", l .. "wsl", ":set spr<Cr>:vsp<Cr>"              , opts)
-- }}}

-- Jump between windows {{{
vim.keymap.set("n", l .. "h" , "<C-w>h", opts)
vim.keymap.set("n", l .. "j" , "<C-w>j", opts)
vim.keymap.set("n", l .. "k" , "<C-w>k", opts)
vim.keymap.set("n", l .. "l" , "<C-w>l", opts)
vim.keymap.set("n", l .. "wo", "<C-w>o", opts)

--vim.keymap.set('t', l..'h', '<C-\\><C-n><C-w>h', opts)
--vim.keymap.set('t', l..'j', '<C-\\><C-n><C-w>j', opts)
--vim.keymap.set('t', l..'k', '<C-\\><C-n><C-w>k', opts)
--vim.keymap.set('t', l..'l', '<C-\\><C-n><C-w>l', opts)
-- }}}

-- Toggle between horizon & vert split {{{
vim.keymap.set("n", l .. "wh", "<C-w>b<C-w>K", opts)
vim.keymap.set("n", l .. "wv", "<C-w>b<C-w>H", opts)
-- }}}

-- Adjust window size {{{
vim.keymap.set('n', '<Up>'   , ':resize +5<Cr>'  , opts)
vim.keymap.set('n', '<Down>' , ':res -5<Cr>'     , opts)
vim.keymap.set('n', '<Left>' , ':vert res +5<Cr>', opts)
vim.keymap.set('n', '<Right>', ':vert res -5<Cr>', opts)
-- }}}

-- }}}

-- Tabs {{{
vim.keymap.set("n", l .. "ti", ":tabe<Cr>", opts)
vim.keymap.set("n", l .. "th", ":tabp<Cr>", opts)
vim.keymap.set("n", l .. "tl", ":tabn<Cr>", opts)

-- Move tabs
--vim.keymap.set('n', l..'tmh', ':-tabmove<Cr>', opts)
--vim.keymap.set('n', l..'tml', ':+tabmove<Cr>', opts)

vim.keymap.set("n", l .. "tc", ":tabc<Cr>", opts)
vim.keymap.set("n", l.."to"  , ":tabo<Cr>", opts)
--}}}

-- Session {{{
vim.o.ssop = "blank,buffers,curdir,globals,tabpages,folds,help,resize,winpos,winsize,terminal"

vim.keymap.set("n", "<Leader>ms", ":mksession! my.vim<Cr> :wviminfo! my.viminfo<Cr>", opts)
vim.keymap.set("n", "<Leader>ss", ":source my.vim<Cr> :rviminfo my.viminfo<Cr>"     , opts)
--}}}

-- Buffers {{{
vim.keymap.set("n", l .. "bd", ":bd %<Cr>", opts)
vim.keymap.set("n", l .. "bh", ":bp<Cr>"  , opts)
vim.keymap.set("n", l .. "bl", ":bn<Cr>"  , opts)
-- }}}

-- Quick fix and location list {{{
vim.keymap.set("n", l .. "Qo", ":copen<Cr>" , opts)
vim.keymap.set("n", l .. "Qc", ":cclose<Cr>", opts)
vim.keymap.set("n", l .. "Qj", ":cnext<Cr>" , opts)
vim.keymap.set("n", l .. "Qk", ":cprev<Cr>" , opts)

vim.keymap.set("n", l .. "Lo", ":lopen<Cr>" , opts)
vim.keymap.set("n", l .. "Lc", ":lclose<Cr>", opts)
vim.keymap.set("n", l .. "Lj", ":lnext<Cr>" , opts)
vim.keymap.set("n", l .. "Lk", ":lprev<Cr>" , opts)
-- }}}

-- {{{
--vim.keymap.set('', '<F2>', 'GoDate: <Esc>:read !date<Cr>kJ', opts)

--vim.api.nvim_vim.keymap.set('n', '<A-=>', ':sp term://bash<Cr>', opts)
--vim.api.nvim_vim.keymap.set('t', '<A-=>', '<C-\\><C-n>:bd! %<Cr>', opts)
vim.keymap.set("n", l .. "ro", ":setlocal readonly!<Cr>", opts)
-- }}}

-- Clear registers {{{
--vim.cmd[[
--function ClearClip()
--let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"+*'
--let i=0
--while (i<strlen(regs))
--exec 'let @'.regs[i].'=""'
--let i=i+1
--endwhile
--unlet regs
--endfunction
--nnoremap <Leader>rc :call ClearClip()<Cr>
--]]
-- }}}

-- n:<Leader>+1,<Leader>-1 {{{
--vim.keymap.set('n', l..'+1', '<C-a>', opts)
--vim.keymap.set('n', l..'-1', '<C-x>', opts)
-- }}}

-- refersh buffer
local function refreshBuf()
  vim.cmd("set noconfirm")
  vim.cmd("bufdo e !")
  vim.cmd("set confirm")
end

vim.keymap.set("n", "<leader>rb", refreshBuf)

-- vim: foldmarker={{{,}}} fdm=marker
