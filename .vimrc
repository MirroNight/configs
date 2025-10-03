" to use this profile, copy this file to your home directory.


" to share config with nvim, perform following actios:
" mkdir -p ~/.config/nvim/
" cp /mnt/80T/paxon/init.vim ~/.config/nvim/init.vim

" use \t for all other filetype
set noexpandtab

" use 4 spaces for python and R
augroup customFileType
  autocmd!
  autocmd BufRead,BufNewFile *.py,*.r setlocal expandtab
augroup END

syntax on
filetype plugin indent on
set nu
set cursorline
set tabstop=4
set shiftwidth=4
set whichwrap+=<,>,[,]
set nowrap
set backspace=indent,eol,start

" Select Colorshceme
" default desert slate pablo ron elflord koehler torte
colo slate

"""  Useful hotkeys
" :w    writefile (:wq to write and quit)
" :q!   force quit
" D     delete rest of the line and insert
" S     delete line and insert
" s     delete current char and insert
" a     insert after current char
" o     open new line and insert
" v     visual
" <S-v> visual line
" <C-v> visual block
" d-num delete/cut (or d under visual mode)
" dd    delete/cut line
" y     copy
" p     paste


" use line cursor in insert mode, and block cursor in everything else
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Search highlight
set hlsearch

" Select in visual and execute command
vnoremap <S-C-x> "ay:!a

" F1 Cancel highlith after search, will comeback next search
nnoremap <F1> :noh<CR>
inoremap <F1> <C-o>:noh<CR>

" F3 Toggle line number
nnoremap <F3> :set invnumber<CR>
inoremap <F3> <C-o>:set invnumber<CR>

" F4 Fold corresponding bracket block
nnoremap <F4> %zf%
inoremap <F4> <C-o>%<C-o>zf%

" F5 Toggle folded block
nnoremap <F5> za
inoremap <F5> <C-o>za

" F6 Switch between windows
nnoremap <F6> <C-w>w
inoremap <F6> <C-o><C-w>w

" F7 Open seperate window (vertical)
nnoremap <F7> <C-w>v<C-w>w
inoremap <F7> <C-o><C-w>v<C-o><C-w>w

" F8 Open seperate window (horizontal)
nnoremap <F8> <C-w>s<C-w>w
inoremap <F8> <C-o><C-w>s<C-o><C-w>w

" F9 Toggle line wrap
nnoremap <F9> :set invwrap<CR>
inoremap <F9> <C-o>:set invwrap<CR>

" alt Up/Down to swap lines
nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+1<CR>
inoremap <A-Up> <C-o>:m-2<CR>
inoremap <A-Down> <C-o>:m+1<CR>

" alt Left/Right to indent/unindent
nnoremap <A-Right> i<C-t><Right><esc>
nnoremap <A-Left> i<C-d><Right><esc>
inoremap <A-Right> <C-t>
inoremap <A-Left> <C-d>
vnoremap <A-Right> >gv<Right>
vnoremap <A-Left> <gv<Left>

" tab to indent in Visual mode
vnoremap <Tab> >gv<Right>
" shift-tab to unindent in Visual mode
vnoremap <S-Tab> <gv<Left>

" ctrl BS/Del to delete word in Insert mode
inoremap <C-BS> <Left><C-o>diw
inoremap  <Left><C-o>diw
inoremap <M-BS> <Left><C-o>diw

inoremap <C-Del> <Right><C-o>diw
inoremap ^[[3;5~ <Right><C-o>diw
inoremap <M-Del> <Right><C-o>diw

" ctrl u to undo in Insert mode
inoremap <C-u> <C-o>u

" ctrl r to redo in Insert mode
inoremap <C-r> <C-o><C-r>

" ctrl a to paste in Insert mode
inoremap <C-a> <Left><C-o>p

" ctrl Up/Down to jump paragraph
nnoremap <C-Up> {
nnoremap <C-Down> }
inoremap <C-Up> <C-o>{
inoremap <C-Down> <C-o>}
vnoremap <C-Up> {
vnoremap <C-Down> }

" ctrl / to jump between corresponding bracket
nnoremap  %
inoremap  <C-o>%

" ctrl f to search for visually hightlighted text and prompt replace
vnoremap <c-f> y<ESC>/<c-r>"<CR>:%s//

" Color configuration
" set bg=dark
" set t_md=
hi CursorLine cterm=NONE term=NONE ctermbg=NONE guibg=Gray40
hi LineNr cterm=NONE ctermfg=DarkGray ctermbg=NONE
hi CursorLineNr ctermfg=LightGreen cterm=bold ctermbg=240

" Reset background color to black
hi Normal ctermbg=NONE

" F2 Toggle quickfix list
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> <F2> :call ToggleQuickFix()<cr>

" Auto open location/quickfix list when a :make, :grep, :lvimgrep, :vimgrep have valid locations/errors
" :vimgrep (:vim) /pattern/[g][j] %
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END
" Alterantive: (can swap grep with vimgrep)
"command! -nargs=+ vgrep execute 'silent grep! <args>' | copen

" [/] to move through quicklist items (this will disable [[/]])
nnoremap [ :cprev<CR>
nnoremap ] :cnext<CR>
nnoremap <S-Up> :cfirst<CR>
nnoremap <S-Down> :clast<CR>

" Mapping that only works in quickfix window
" [/] Go to the previous/next location and stay in the quickfix window
function! QuickfixMapping()
    nnoremap <buffer> [ :cprev<CR>zz<C-w>w
    nnoremap <buffer> ] :cnext<CR>zz<C-w>w
    nnoremap <buffer> <S-Up> :cfirst<CR>zz<C-w>w
    nnoremap <buffer> <S-Down> :clast<CR>zz<C-w>w
endfunction

augroup quickfix_group
    autocmd!
    autocmd filetype qf call QuickfixMapping()
augroup END
