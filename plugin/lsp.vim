"""noremap <silent><expr> <C-Space> compe#complete()
"""inoremap <silent><expr> <CR>      compe#confirm('<CR>')
"""inoremap <silent><expr> <C-e>     compe#close('<C-e>')
"""inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4  })
"""inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4  })
set completeopt=menuone,noinsert,noselect
set shortmess+=c

autocmd BufEnter * lua require'completion'.on_attach()

let g:UltiSnipsExpandTrigger='<null>'

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
noremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_enable_snippet = 'UltiSnips'


