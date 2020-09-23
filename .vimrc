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
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/neocomplete.vim' " 自動補完
Plugin 'Shougo/neocomplcache' " cache
Plugin 'Shougo/neosnippet' "スニペット機能
Plugin 'Shougo/neosnippet-snippets' "スニペットのデータ
Plugin 'majutsushi/tagbar.git' " 変数一覧、関数を表示
Plugin 'scrooloose/nerdtree.git' " ファイラー
Plugin 'othree/html5.vim'          " html5のタグのカラー
Plugin 'bronson/vim-trailing-whitespace' "不要な空白(whitespace)に赤色を付ける
Plugin 'jacoborus/tender.vim' " ColorScheme
Plugin 'davidhalter/jedi-vim' " Python用
Plugin 'fatih/vim-go' " Golang
Plugin 'po3rin/vim-gofmtmd' " Markdown go code
Plugin 'airblade/vim-gitgutter' " Git diff showing side inline
let g:lsp_async_completion = 1 " For vim-gofmtmd

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


 "------------------------------------------------------------
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



 "------------------------------------------------------------
 " Plugin
 "------------------------------------------------------------
 filetype plugin on
 nmap <F9> :TagbarToggle<CR>
 map <C-n> :NERDTreeToggle<CR>

 "------------------------------------------------------------
 " NeoBundle
 "------------------------------------------------------------
 " Note: Skip initialization for vim-tiny or vim-small.
 "
 let g:neocomplete#enable_at_startup = 1

 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif


 "------------------------------------------------------------
 " vim-go
 "------------------------------------------------------------
 let g:go_fmt_command = "goimports"
