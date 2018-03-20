command! UrlOpen call g:url#open(expand('<cWORD>'))

function! g:url#open(word)
  for transformer in g:url_transformers
    let l:Try = function(transformer)
    let result = l:Try(a:word)
    if result != ""
      call url#open_with_netrw(result)
      return
    endif
  endfor
  call url#open_with_netrw(a:word)
endfunction

function! g:url#open_with_netrw(url)
  if has("patch-7.4.567")
    call netrw#BrowseX(a:url, 0)
  else
    call netrw#NetrwBrowseX(a:url, 0)
  endif
endfunction

if maparg('gx', 'n') ==# '<Plug>NetrwBrowseX' || maparg('gx', 'n') ==# '<Plug>BrowseX'
  nnoremap gx :UrlOpen<CR>
endif
