execute pathogen#infect()
syntax on
filetype plugin indent on
" set number
" set mouse=a

let g:syntastic_javascript_checkers = ['jsxhint']
let g:tagbar_usearrows = 1
nmap <F6> :! cordova run android<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :SyntasticCheck<CR>
nmap <F10> :%s/à/\&agrave;/g \| :%s/è/\&egrave;/g \| :%s/é/\&eacute;/g \| :%s/ì/\&igrave;/g \| :%s/ò/\&ograve;/g \| :%s/ù/\&ugrave;/g<CR>
nmap <leader>w :w!<cr>
set pastetoggle=<F2>

" Ignore case when searching
set ignorecase
" Highlight search results
set hlsearch

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

colorscheme peachpuff

if filereadable(".vimrc_custom")
	source .vimrc_custom
endif
