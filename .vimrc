" FEATURE DETECTION {{{
  let s:has_lua = has('lua')
  let s:has_mercurial = executable('hg')
"}}}

" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif
 
 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 "
 "
 "
 
 NeoBundle 'scrooloose/nerdtree'
 map <C-b> :NERDTreeToggle<CR>
 nnoremap <leader>no :NERDTreeFind<CR>
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 
 NeoBundle 'tpope/vim-surround'
 
 NeoBundle 'kien/ctrlp.vim'
 let g:ctrlp_match_window = 'results:25'

 NeoBundle 'fholgado/minibufexpl.vim'
 let g:miniBufExplBRSplit = 0
 let g:miniBufExplorerAutoStart = 1

"Omnisharp plugin 
NeoBundle 'OmniSharp/omnisharp-vim'
let g:OmniSharp_loaded = 1
let g:OmniSharp_timeout = 1
set noshowmatch
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
set completeopt=longest,menuone,preview
set splitbelow
autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuildAsync<cr>
autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
nnoremap <leader>fm :OmniSharpFindMembersInBuffer<cr>
nnoremap <leader>x  :OmniSharpFixIssue<cr>
nnoremap <leader>fx :OmniSharpFixUsings<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>dc :OmniSharpDocumentation<cr>
let g:syntastic_cs_checkers = ['syntax', 'issues']
autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
set updatetime=500
set cmdheight=2
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <leader>tp :OmniSharpAddToProject<cr>
autocmd BufWritePost *.cs call OmniSharp#AddToProject()
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
set hidden
let g:Omnisharp_start_server = 0

"Supertab plugin
NeoBundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1


 NeoBundle 'tpope/vim-eunuch'
 NeoBundle 'mhinz/vim-startify' 
 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'kshenoy/vim-signature'
		
 NeoBundle 'scrooloose/nerdtree'
		
 NeoBundle 'Lokaltog/vim-easymotion' "{{{
        let g:EasyMotion_leader_key='s'
    "}}}

 NeoBundle 'tommcdo/vim-exchange'
 NeoBundle 'tpope/vim-unimpaired'
 NeoBundle 'terryma/vim-expand-region'
 NeoBundle 'michaeljsmith/vim-indent-object'
 NeoBundle 'Spaceghost/vim-matchit'
 NeoBundle 'troydm/easybuffer.vim' "{{{
        nnoremap <leader>b :EasyBuffer<cr>
    "}}}
 NeoBundle 'vim-scripts/bufkill.vim'
 NeoBundle 'sjl/gundo.vim'
 NeoBundle 'tpope/vim-fugitive'
 
 if s:has_mercurial
            NeoBundle 'bitbucket:ludovicchabant/vim-lawrencium'
            NeoBundle 'phleet/vim-mercenary'
 endif
 NeoBundle 'mhinz/vim-signify' "{{{
            let g:signify_sign_add               = '+'
            let g:signify_sign_change            = '!'
            let g:signify_sign_delete            = '_'
            let g:signify_sign_delete_first_line = '‾'
        "}}}
 
 NeoBundle 'altercation/vim-colors-solarized'
 NeoBundle 'honza/vim-snippets'
 NeoBundle 'Shougo/neosnippet-snippets'
 NeoBundle 'Shougo/neosnippet.vim' 
 NeoBundle 'tomtom/tcomment_vim'
 NeoBundle 'tpope/vim-repeat'
 NeoBundle 'tpope/vim-unimpaired'
 NeoBundle 'terryma/vim-multiple-cursors'
 NeoBundle 'scrooloose/syntastic' "{{{
 	let g:syntastic_error_symbol = "X"
    let g:syntastic_style_error_symbol = ">"
    let g:syntastic_warning_symbol = "!"
    let g:syntastic_style_warning_symbol = ">"
	
	let g:syntastic_enable_balloons = 0
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_jump = 0
	let g:syntastic_enable_signs = 0
 
 	" Set up json syntax linter and make sure json files use json
 	" filetype instead of javascript
 	autocmd BufRead,BufNewFile *.json set filetype=json
 	let g:syntastic_json_checkers = ['jsonlint']
 
 	" C# syntax checkers
 	" let g:syntastic_cs_checkers = ['syntax', 'issues']
 "}}}
 
 NeoBundleLazy 'godlygeek/tabular', {'autoload':{'commands':'Tabularize'}} "{{{
 	nmap <Leader>a= :Tabularize /=<CR>
 	vmap <Leader>a= :Tabularize /=<CR>
 	nmap <Leader>a: :Tabularize /:<CR>
 	vmap <Leader>a: :Tabularize /:<CR>
 "}}}

 NeoBundle 'tpope/vim-dispatch' "{{{
	if neobundle#is_sourced('vim-dispatch')
		nnoremap <leader>tag :Dispatch ctags -R .<cr>
	endif
 "}}}

 NeoBundle 'nathanaelkane/vim-indent-guides'
 NeoBundle 'jonathanfilip/vim-lucius'
 
 NeoBundle 'moll/vim-node'
 NeoBundle 'aspnetcs'
 NeoBundle 'maxbrunsfeld/vim-yankstack'
 NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}

 NeoBundle 'xolox/vim-notes'
 NeoBundle 'xolox/vim-misc'
 NeoBundle 'lilydjwg/colorizer'

 "Airline plugin
 NeoBundle 'bling/vim-airline'
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#left_sep = ' '
 let g:airline#extensions#tabline#left_alt_sep = '|'
 let g:airline_powerline_fonts = 1
 let g:airline#theme#molakai#palette = {}
 
 NeoBundle 'nanotech/jellybeans.vim'
 
 NeoBundle 'ntpeters/vim-better-whitespace'
 autocmd FileType cs autocmd BufWritePre <buffer> StripWhitespace
 
 NeoBundle 'sjl/badwolf' 
  call neobundle#end()
 
 NeoBundle 'Shougo/neocomplcache.vim'
 let g:neocomplcache_enable_at_startup = 1
 
 " Required:
 filetype plugin indent on

 " Enable syntax highlighting
 syntax on

"Backup settings
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"Vim search settings
set ignorecase
set smartcase

"Vim ui settings
set colorcolumn=90
set relativenumber
set number
set t_Co=256
:set tabstop=4 shiftwidth=4 expandtab
:retab
set directory=.,$TEMP
"set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

syntax enable
set background=dark
colorscheme solarized

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck