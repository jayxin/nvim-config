local M = {}
function M.config()
  -- PDF Viewer:
  -- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
  --vim.g['vimtex_view_method'] = 'skim'
  --vim.g['vimtex_quickfix_mode'] = 0

  -- Ignore mappings
  vim.g['vimtex_mappings_enabled'] = 1

  -- Auto Indent
  vim.g['vimtex_indent_enabled'] = 1

  -- Syntax highlighting (handled by Treesitter)
  vim.g['vimtex_syntax_enabled'] = 0

  -- Error suppression:
  -- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

  --vim.g['vimtex_log_ignore'] = ({
    --'Underfull',
    --'Overfull',
    --'specifier changed to',
    --'Token not allowed in a PDF string',
  --})

  --vim.g['vimtex_context_pdf_viewer'] = 1
  --vim.g['vimtex_context_pdf_viewer'] = 'skim'
  --vim.g['vimtex_context_pdf_viewer'] = 'okular'

  -- vim.g['vimtex_complete_enabled'] = 1
   --vim.g['vimtex_compiler_progname'] = 'nvr'
  -- vim.g['vimtex_complete_close_braces'] = 1
  vim.cmd([[
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
            \ 'build_dir' : '',
            "\ 'callback' : 1,
            "\ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            "\ 'hooks' : [],
            \ 'options' : [
            "\   '-verbose',
            \   '-shell-escape',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=batchmode',
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
      "noremap <leader>v <Plug>(vimtex-view)
      noremap <silent> <leader>v <Cmd>VimtexView<CR>
    ]])
end

return M
