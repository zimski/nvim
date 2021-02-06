function git#init()
  function! s:init_customer_fugitive_mapping() abort
    nmap <buffer> <Tab> =
    nmap <buffer> P<SPACE> :Git push 
    nmap <buffer> p<SPACE> :Git pull 
    nmap <buffer> ll :Git log -20 --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit<CR>
  endfunction


  function! s:bind_rebase_mapping() abort
    nnoremap <buffer> p 0ciwpick<ESC>0
    nnoremap <buffer> r 0ciwreword<ESC>0
    nnoremap <buffer> e 0ciwedit<ESC>0
    nnoremap <buffer> s 0ciwsquash<ESC>0
    nnoremap <buffer> f 0ciwfixup<ESC>0
    nnoremap <buffer> x 0ciwexec<ESC>0
    nnoremap <buffer> d 0ciwdrop<ESC>0
  endfunction


  function! s:rebase_dot() abort

    let sha = gv#sha()
    return empty(sha) ? '' : ':Git  rebase -i '.sha."~1"

  endfunction

  augroup FugitiveCustomMappings
    autocmd! *
    autocmd FileType fugitive call s:init_customer_fugitive_mapping()
    autocmd FileType gitrebase call s:bind_rebase_mapping()
    autocmd FileType gitcommit setlocal spell
  augroup END
endfunction
