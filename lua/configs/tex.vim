nmap dsm <Plug>(vimtex-env-delete-math)

omap am <Plug>(vimtex-a$)
xmap am <Plug>(vimtex-a$)
omap im <Plug>(vimtex-i$)
xmap im <Plug>(vimtex-i$)

omap ai <Plug>(vimtex-am)
xmap ai <Plug>(vimtex-am)
omap ii <Plug>(vimtex-im)
xmap ii <Plug>(vimtex-im)

" [Options] {{{
let g:vimtex_indent_enabled = 0 " turn off indentation
"let g:vimtex_imaps_enabled = 0 " disable insert mode mappings
"let g:vimtex_complete_enabled = 0 " turn off completion
let g:vimtex_syntax_enabled = 0 " disable syntax conceal

" let g:vimtex_delim_toggle_mod_list = [
"   \ ['\left', '\right'],
"   \ ['\big', '\big'],
"   \]
" }}}

" [Commands] {{{
noremap <leader>wc <Cmd>VimtexCountWords<CR>
" }}}

"let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_general_viewer = 'sioyek'
"let g:vimtex_view_method = 'sioyek'

let g:tex_flavor = 'latex'

" let g:vimtex_quickfix_mode = 0
" let g:vimtex_quickfix_open_on_warning = 0

"let g:vimtex_compiler_progname = 'nvr'

let g:vimtex_toc_enabled = 1

let g:vimtex_toc_config = {
    \ 'name': 'TOC',
    \ 'layers': ['content', 'todo', 'include'],
    \ 'split_width': 25,
    \ 'todo_sorted': 0,
    \ 'show_help': 1,
    \ 'show_numbers': 1,
\}

let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'build',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-shell-escape',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \   '-xelatex',
        \   '-halt-on-error'
        \ ],
        \}

let g:vimtex_compiler_latexmk_engines = {
        \ '_'                : '-xelatex',
        \ 'pdfdvi'           : '-pdfdvi',
        \ 'pdfps'            : '-pdfps',
        \ 'pdflatex'         : '-pdf',
        \ 'luatex'           : '-lualatex',
        \ 'lualatex'         : '-lualatex',
        \ 'xelatex'          : '-xelatex',
        \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}

let g:vimtex_fold_enabled = 1

noremap <localleader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>
noremap <leader>v <Plug>(vimtex-view)
