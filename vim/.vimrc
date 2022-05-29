"=== File Settings ===
set encoding=utf-8 " Set encoding for glyphs to display properly
syntax on
set relativenumber
set nu
set showcmd
set incsearch
set ignorecase
set smartcase
set nowrap
highlight QuickFixLine ctermbg=none

"=== Format Settings ===
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab " Set tabbing to 4 spaces
set autoindent
filetype plugin indent on

"=== IDE plugins ===
let mapleader = " "

vnoremap <leader>y :!xclip -f -sel clip<CR>
nnoremap <leader>p :r !xclip -o -sel clip<CR>
nnoremap <leader>P :-1r !xclip -o -sel clip<CR>

"--- Airline ---
let g:airline_section_b = "%{FugitiveStatusline()}"
let g:airline_symbols_ascii = 1

"--- YouCompleteMe
function! ReplaceAll()
    call inputsave()
    let replacement = input('Enter replacement:')
    call inputrestore()
    execute ':YcmCompleter RefactorRename '.replacement
    execute 'copen'
endfunction
command! ReplaceAll :call ReplaceAll()
command! ClearQuickFixList cexpr []

nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>R :ReplaceAll<CR>
let g:syntastic_java_checkers = []
let g:EclimFileTypeValidate = 0
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_echo_current_diagnostic = 1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0

" Setup lombok
let g:ycm_global_ycm_extra_conf='~/.config/vim/YouCompleteMe/lombok/.ycm_extra_conf.py'

"--- Fzf ---
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>cm :Commits<CR>

"--- NERDTree ---
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeNaturalSort = 1

"--- ALE ---
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'
let g:ale_cursor_detail = 1
highlight ALEError ctermbg=none
highlight ALEWarning ctermbg=None
let g:ale_linters = {
        \ 'javascript': ['eslint'],
        \ 'yaml': ['yamllint']
    \ }
let g:ale_java_javac_executable = 'javac -cp ~/.m2/repository/org/projectlombok/lombok/1.18.10/lombok-1.18.10.jar'
let g:ale_javascript_eslint_executable='npx eslint'
" Yamllint not working; fix later
let g:ale_openapi_yamllint_executable='npx yamllint'
let g:ale_openapi_yamllint_use_global=1

augroup joe
    autocmd!
    " Remove trailing white spaces on write
    autocmd BufWritePre * :%s/\s\+$//e
    " Organzie imports on write
    "autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.java :YcmCompleter OrganizeImports
augroup end

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
