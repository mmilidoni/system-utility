execute pathogen#infect()
syntax on
filetype plugin indent on
" set number
" set mouse=a

let g:syntastic_javascript_checkers = ['jsxhint']
let g:tagbar_usearrows = 1
nmap <F6> :! phonegap run android<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :SyntasticCheck<CR>
nmap <F10> :%s/à/\&agrave;/e \| :%s/è/\&egrave;/e \| :%s/é/\&eacute;/e \| :%s/ì/\&igrave;/e \| :%s/ò/\&ograve;/e \| :%s/ù/\&ugrave;/e<CR>
nmap <leader>w :w!<cr>
set pastetoggle=<F2>

" Ignore case when searching
set ignorecase
" Highlight search results
set hlsearch

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" set number
tab ball

set t_Co=256
"#colorscheme CandyPaper
colorscheme peachpuff

if filereadable(".vimrc_custom")
	source .vimrc_custom
endif

highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline  
