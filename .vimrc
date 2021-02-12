 "------------------------------------------------------------
 " Bundles preference
 "------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" ############
" Git
" ############
Plugin 'tpope/vim-fugitive'                    " A Git wrapper so awesome, it should be illegal
Plugin 'airblade/vim-gitgutter'                " Git diff showing side inline

" ############
" Major Utils
" ############
Plugin 'vim-test/vim-test'                     " Run your tests at the speed of thought
Plugin 'tpope/vim-dispatch'                    " Asynchronous build and test dispatcher
Plugin 'scrooloose/nerdtree.git'               " A tree explorer plugin for vim.
Plugin 'ryanoasis/vim-devicons'                " Adds file type icons to Vim plugins such as: NERDTree
Plugin 'junegunn/fzf.vim'                      " fzf vim

" Minor Utils
Plugin 'jacoborus/tender.vim'                  " ColorScheme
Plugin 'bronson/vim-trailing-whitespace'       " 不要な空白(whitespace)に赤色を付ける

" ############
" vim-lsp
" ############
Plugin 'prabirshrestha/asyncomplete.vim'       " async completion in pure vim script for vim8 and neovim
Plugin 'prabirshrestha/asyncomplete-lsp.vim'   " Provide Language Server Protocol autocompletion source for asyncomplete.vim and vim-lsp
Plugin 'prabirshrestha/vim-lsp'                " async language server protocol plugin for vim and neovim
Plugin 'mattn/vim-lsp-settings'                " Auto configurations for Language Server for vim-lsp
Plugin 'SirVer/ultisnips'                      " The ultimate snippet solution for Vim.
Plugin 'honza/vim-snippets'                    " This repository contains snippets files for various programming languages.
Plugin 'thomasfaingnaert/vim-lsp-snippets'     " Language Server Protocol snippets in vim using vim-lsp
Plugin 'thomasfaingnaert/vim-lsp-ultisnips'    " Language Server Protocol snippets in vim using vim-lsp and UltiSnips
Plugin 'hrsh7th/vim-vsnip'                     " Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
Plugin 'hrsh7th/vim-vsnip-integ'               " vim-vsnip integrations to other plugins.

" ############
" Golang
" ############
Plugin 'mattn/vim-goimports'                   " goimports
Plugin 'buoto/gotests-vim'                     " Vim plugin for https://github.com/cweill/gotests
Plugin 'sebdah/vim-delve'                      " Neovim / Vim integration for Delve

" ############
" For Terraform
" ############
Plugin 'hashivim/vim-terraform' " Terraform

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

 "------------------------------------------------------------
" For LSP settings
 "------------------------------------------------------------
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  nmap <buffer> <Leader>d <plug>(lsp-type-definition)
  nmap <buffer> <Leader>r <plug>(lsp-references)
  nmap <buffer> <Leader>i <plug>(lsp-implementation)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:asyncomplete_auto_popup = 1
" let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

let g:lsp_settings = {}
let g:lsp_settings['gopls'] = {
  \  'workspace_config': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \  'initialization_options': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \}

" For snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set completeopt+=menuone

 "------------------------------------------------------------
 " fzf setting
 "------------------------------------------------------------
set rtp+=/usr/local/opt/fzf

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~50%' }
command! FZFFileList call fzf#run({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
            \ 'sink': 'e'})
" Files command with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
nnoremap <C-p> :GFiles<CR>
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

 "------------------------------------------------------------
 " General preference
 "------------------------------------------------------------

set clipboard=unnamed      " Vimの無名レジスタとOSのクリップボードを連携させる
 "set noswapfile           " スワップファイルをつくらない
set nocompatible          " vi互換モードをオフ（vimの拡張機能を有効)
set hidden                " 編集中でも、保存しないで他のファイルを開けるようにする
set confirm               " ファイルを保存していない場合に、ファイルの保存を確認するダイアログを出す
set cmdheight=2           " 画面下部に表示されるコマンドラインの高さの設定
set showcmd               " 入力したコマンドをステータスライン上に表示  例えばdを入力したらdと表示される
set scrolloff=5           " カーソルの上または下に表示される最小限の行数  5に設定してあるので、下に5行は必ず表示される
set visualbell            " ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set vb t_vb=              " ビープを鳴らさない
set mouse=a               " 全モードでマウスを有効化
set autowrite
" キーコードはすぐにタイムアウト  マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

"------------------------------------------------------------
" Color
"------------------------------------------------------------
syntax enable " ハイライトを有効化
syntax on     " ハイライトを有効化
set t_Co=256
set background=dark
colorscheme tender
highlight Normal ctermbg=none

highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/
"set cc=80
":hi ColorColumn ctermbg=0


"------------------------------------------------------------
" Status line
"------------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示する
set ruler        " ステータスライン上にルーラーを表示する（カーソルが何行目の何列目に置かれているか）

"[ファイルフォーマット][エンコーディング][改行タイプ] 行数, 列数／総列数
set statusline=%F%m%r%h%w\%=[FILETYPE=%Y][ENC=%{&fenc}][%{&ff}]%=%c,\%l/%L

let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

 highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
 match OverLength /\%>80v.\+/
 highlight OverLength ctermbg=black ctermfg=white
 match OverLength /\%81v.\+/
 "set cc=80
 "execute "set colorcolumn=" . join(range(81,335), ',')
 ":hi ColorColumn ctermbg=0

 let mapleader=","
 inoremap <leader>, <C-x><C-o>

 "------------------------------------------------------------
 " Indent
 "------------------------------------------------------------
 set autoindent     " オートインデント
 set smartindent    " 新しい行を開始した時に、新しい行のインデントを現在行と同じ量にする
 set cindent        " Cプログラムの自動インデント
 set smarttab        "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
 set expandtab      " タブキーを空白に変換
 set virtualedit=block " 短形選択が文字を含まない場所も選択可能にする

 " オートインデント、改行、インサートモード開始直後にバックスペースキーで削除できるようにする
 set backspace=indent,eol,start

 " softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
 set tabstop=4 shiftwidth=4 softtabstop=0

" ファイルの拡張子によってタブのインデント幅を変える cited from http://qiita.com/mitsuru793/items/2d464f30bd091f5d0fef
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=0 shiftwidth=4
    autocmd BufNewFile,BufRead *.cs setlocal tabstop=2 softtabstop=0 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=0 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=0 shiftwidth=2
    autocmd BufNewFile,BufRead *.ts setlocal tabstop=2 softtabstop=0 shiftwidth=2
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=0 shiftwidth=2
    autocmd BufNewFile,BufRead *.less setlocal tabstop=2 softtabstop=0 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=0 shiftwidth=2
    autocmd BufNewFile,BufRead *.sh setlocal tabstop=2 softtabstop=0 shiftwidth=2
    autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=0 shiftwidth=2
    autocmd BufNewFile,BufRead *.yaml setlocal tabstop=2 softtabstop=0 shiftwidth=2
augroup END

 " MEMO
 " autoindent  : 改行時に半角スペース8文字を挿入する
 " smartindent : 新しい行をつくったときに高度な自動インデントを行う  cindentがONだと無効化される
 " tabstop     : タブ文字の幅を設定する  デフォルトは8
 " expandtab   : TABキー入力時に、タブ文字の代わりにスペースにする
 " softtabstop : タブ文字を入力した際にタブ文字の代わりに挿入されるホワイトスペースの量を設定する  shiftwidthと同じ値にすると良い
 " shiftwidth  : 「>>」等のコマンドや自動インデントの際に使う1レベル分のインデント量を設定する  tabstopと同じ値にすると良い

 "------------------------------------------------------------
 " Display
 "------------------------------------------------------------
 set number     " 行番号を表示
 set showmatch  " カッコの対応をハイライト
 set cursorline " カーソル行のハイライト
 "set list       " 不可視文字の表示
 "set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

 " Hilight full width space
 " ref: http://code-life.net/?p=2704
 function! ZenkakuSpace()
   highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
 endfunction

 if has('syntax')
   augroup ZenkakuSpace
     autocmd!
     autocmd ColorScheme       * call ZenkakuSpace()
     autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
   augroup END
   call ZenkakuSpace()
 endif

 "------------------------------------------------------------
 " Complision
 "------------------------------------------------------------
 set wildmenu       " コマンドラインモードでTABキーによる補完を有効化
 set wildchar=<tab> " コマンド補完を開始するキー
 set history=1000   " コマンド・検索パターンの履歴数
 set wildmode=list:longest,full

 " wildmodeのオプション色々
 " [none]       最初のマッチのみを補完する。
 " full         次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び最初のマッチが補完される
 " longest      共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る
 " longest:full longestと似ているが、'wildmenu' " が有効ならばそれを開始する
 " list"        複数のマッチがあるときは、全てのマッチを羅列する。
 " list:full    複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する
 " list:longest 複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完される

 "------------------------------------------------------------
 " Search
 "------------------------------------------------------------
 set wrapscan   " 最後まで検索したら先頭に戻る
 set ignorecase " 大文字小文字を無視する
 set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
 set hlsearch   " 検索語を強調表示
 set incsearch  " インクリメンタルサーチを有効化

 "------------------------------------------------------------
 " Key map
 "------------------------------------------------------------
 " Escの2回押しでハイライト消去
 nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
 inoremap <C-j> <Esc>
 inoremap <silent> jj <ESC>
 inoremap <silent> っj <ESC>
 inoremap <silent> hh <ESC>
 inoremap <silent> っh <ESC>
 inoremap <silent> kk <ESC>
 inoremap <silent> っk <ESC>
 "inoremap <silent> ll <ESC>
 " Delete in insert mode
 inoremap <C-x> <BS>

 " For neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


 "------------------------------------------------------------
 " Moving
 "------------------------------------------------------------
 set nostartofline " 移動コマンドを使ったとき、行頭に移動しない

 "------------------
 " Encoding
 "------------------------------------------------------------
 set ffs=unix,dos,mac   " 改行文字
 set encoding=utf-8     " デフォルトエンコーディング
 set fileencodings=utf-8

 "------------------------------------------------------------
 " Others
 "------------------------------------------------------------
 " Yの動作をDやCと同じにする
 map Y y$

 " マッピングに関するMEMO
 " noreがつくものとつかないものの違い（mapとnoremapとか）
 " noreがつかないものを使うと、キーの再割当てが発生する
 " -> mapはキーシーケンスを展開した後、さらに別のマップを適用しようとする
 " -> noremapは一度だけ展開する
 " (例)
 " map {A} {X}
 " map {B} {A}
 " 上のようにマッピングされていた場合、Bを押すとAが実行され、さらにAに割り当てられたXが実行される
 " noremapだとマッピングを1度しか展開しない  混乱を避けるためにnore系を利用するのが無難かも

 " noremap  : ノーマルモード＋ビジュアルモード
 " noremap! : コマンドラインモード＋インサートモード
 " nnoremap : ノーマルモード限定
 " vnoremap : ビジュアルモード（選択モード）限定
 " cnoremap : コマンドラインモード限定
 " inoremap : 挿入モード限定


" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

" vim-devicons " https://github.com/ryanoasis/vim-devicons/issues/198
let g:airline_powerline_fonts = 1

"------------------------------------------------------------
" Plugin
"------------------------------------------------------------
 filetype plugin on
 nmap <F9> :TagbarToggle<CR>
 map <C-n> :NERDTreeToggle<CR>

"------------------------------------------------------------
" for vim-test
"------------------------------------------------------------
let test#strategy = "dispatch"
let test#go#runner = 'gotest'

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

function! DebugNearest()
  let g:test#go#runner = 'delve'
  TestNearest
  unlet g:test#go#runner
endfunction
nmap <silent> t<C-d> :call DebugNearest()<CR>

" popup window color
" https://qiita.com/TatchNicolas/items/92c03df6ca82e7374469
" number color: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
" gui color name: http://fugal.net/vim/rgbtxt.html
hi Pmenu ctermbg=8 ctermfg=1 guifg=blue3 guibg=gray
hi PmenuSel ctermbg=13 ctermfg=1
hi SignColumn guibg=RoyalBlue
