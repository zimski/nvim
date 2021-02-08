function! mapping#init()
  tnoremap jj <C-\><C-n>
  " nnoremap <leader>h :wincmd h<CR>
  " nnoremap <leader>j :wincmd j<CR>
  " nnoremap <leader>k :wincmd k<CR>
  " nnoremap <leader>l :wincmd l<CR>

  nnoremap <leader>j :m .+1<CR>==
  nnoremap <leader>k :m .-2<CR>==
  " nnoremap <Leader>ps :Rg<SPACE>
  " nnoremap <leader>pf :GFiles<CR>
  " nnoremap <leader>df :Files<CR>
  " nnoremap <leader>ff :Files %:p:h<CR>
  " nnoremap <leader>bb :Buffers<CR>
  nnoremap <leader>gs :vertical Gstatus<CR>
  " nnoremap <C-p> :GFiles<CR>
  " nnoremap <C-b> :Buffers<CR>
  nnoremap <F1> :so ~/.config/nvim/init.vim<CR>
  nnoremap <F2> :cnext<CR>
  nnoremap <F3> :cprevious<CR>
  nnoremap <Leader>+ :vertical resize +5<CR>
  nnoremap <Leader>- :vertical resize -5<CR>
  " Using lua functions
  nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader>ff <cmd>lua require('zimo.tele').find_files_same_dir()<cr>
  nnoremap <leader>bb <cmd>lua require('zimo.tele').buffers()<cr>
  nnoremap <leader>ps <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
  " nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
  " vnoremap J :m '>+1<CR>gv=gv
  " vnoremap K :m '<-2<CR>gv=gv" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
  " vnoremap <M-1> 1gt
  " vnoremap <M-2> 2gt
  " vnoremap <M-3> 3gt
  " map <D-4> 4gt
  " map <D-5> 5gt
  " map <D-6> 6gt
  " autocmd BufEnter * lua require'completion'.on_attach()
  " Auto-format *.rs (rust) files prior to saving them
  "
  " nnoremap <silent>gd    <cmd>lua vim.lsp.buf.definition()<CR>
  " nnoremap <silent><c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  " nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>

  " autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
  " autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)
  " autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync(nil, 1000)
  " Use <Tab> and <S-Tab> to navigate through popup menu
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " coc configuration
  nnoremap <silent> TRL-6

  nmap - :Fern %:h -reveal=%<CR>
  nnoremap <leader><Tab> <C-^>

  " terminal
  nnoremap <Leader><CR> :Ttoggle<CR>
  " test suite
  nmap <silent> <leader>t. :TestNearest<CR>
  nmap <silent> <leader>tT :TestFile<CR>
  nmap <silent> <leader>tA :TestSuite<CR>
  nmap <silent> <leader>tt :TestLast<CR>
  nmap <silent> <leader>to :TestVisit<CR>

  " coc shortcuts and mapping
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction
  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>
endfunction

