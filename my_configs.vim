nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright


set pastetoggle=<F2>

set nowrap

nnoremap <F3> :NERDTreeToggle<cr>
nnoremap ; :
:set mouse=a


function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

set nu

let g:syntastic_cpp_include_dirs=['/home/radek/seasocks/src/main/c']
"let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
highlight OverLength ctermfg=red guibg=#592929
match OverLength /\%81v.\+/
