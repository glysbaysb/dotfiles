set softtabstop=4
set tabstop=4
set shiftwidth=4

" Turn on line numbering. Turn it off with "set nonu"
set nu

" Set syntax on
syntax on

" Indent automatically depending on filetype
filetype indent on
set autoindent

" Case insensitive search
set ic

" Higlhight search
set hls

" Wrap text instead of being on one line
set lbr

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Allow saving files as sudo
cmap w!! w !sudo tee > /dev/null %

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" bindings
map <F1> :NERDTreeFocus<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :make<CR>
map <F5> :split<CR>
map <F6> :vsplit<CR>
map <F7> :tabprev<CR>
map <F8> :tabnext<CR>
map <F9> <C-W><C-H>
map <F10> <C-W><C-j>
map <F11> <C-W><C-k>
map <F12> <C-W><C-l>

" remap <ESC>
au VimEnter * silent!xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent!xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Don't litter swp files everywhere
set backupdir=~/.cache
set directory=~/.cache

" file specific settings
autocmd FileType python setlocal expandtab
