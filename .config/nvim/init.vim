call plug#begin('~/.config/nvim/plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" if you can not find the 'mkdp#util#install()',
" you need to input ':call mkdp#util#install()',
" if you get 'pre build and node is not found',
" you need go to 'markdown-preview.nvim/app' then input 'yarn install',
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" if you get an about 'yarn' eorro,
" you need go to coc.nvim path to input 'yarn install'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'

call plug#end()

" markdown-preview
let g:mkdp_auto_start=1

" coc.nvim
let g:coc_global_extensions = ['coc-marketplace', 'coc-vimlsp', 'coc-pyls', '@yaegassy/coc-pylsp']
" you can input cocList marketplace to install sth.
set hidden
set updatetime=100
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> gf <Plug>(coc-definition)
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap rn <Plug>(coc-rename)

" preservim/nerdtree
map tt :NERDTreeToggle<CR>
" 'tt' is to open the NERDTree or to colse


set relativenumber
set cursorline
set tabstop=4
set shiftwidth=4
set scrolloff=7
set ignorecase
set spell

let mapleader = ' '

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l
inoremap jk <Esc>
" inoremap <Tab><Tab> &emsp;&emsp;

map S :w<CR>
map q :q<CR>
map Q :q!<CR>
map R :call RunCode()<CR>
func! RunCode()
	exec 'w'
	if &filetype=='python'
		exec "!time python3 %"
	endif
endfunc
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
