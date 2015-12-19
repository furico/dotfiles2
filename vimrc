scriptencoding utf-8

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

""""""""""""""""""""""""""""""""""""""""
" プラグイン

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

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
" ステータスラインをかっこ良くする
NeoBundle 'itchyny/lightline.vim'
" カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" コメントアウトを効率化
NeoBundle 'tomtom/tcomment_vim'
" tmux設定ファイル用
NeoBundle 'tmux-plugins/vim-tmux'
" ファジーファインダー
NeoBundle 'ctrlpvim/ctrlp.vim'
" Pythonの自動補完
NeoBundle 'davidhalter/jedi-vim'
" 文法チェッカー
NeoBundle 'scrooloose/syntastic'
" インデントを見やすく
NeoBundle 'nathanaelkane/vim-indent-guides'
" アウトラインビューア(ctagsが必要)
NeoBundle 'majutsushi/tagbar'

" 個人用wiki
let s:doc4vim_path = $HOME . '/Dropbox/Doc4Vim'
if isdirectory(s:doc4vim_path)
  NeoBundle 'Rykka/riv.vim'
endif

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""
" 基本設定

" 構文ハイライトを有効化
syntax on
" 行番号を表示
set number
" 最下ウィンドウにステータスラインを常に表示
set laststatus=2
" コマンドラインウィンドウに使われる画面上の行数
set cmdheight=2
" コマンドを画面の最下行に表示する
set showcmd
" 変更中のファイルでも保存しないで他のファイルを表示
set hidden
" 検索結果をハイライト
set hlsearch
" 検索で大文字/小文字を区別しない
set ignorecase
" 検索パターンが大文字を含んでいたらオプション'ignorecase'を上書きする。
set smartcase
" インクリメンタルサーチ
set incsearch
" バックアップファイルとスワップファイルを作成しない
set nobackup
set nowritebackup
set noswapfile
" アンドゥファイルを作成しない
set noundofile
" ターミナルでは256色を使用
if !has('gui_running')
  set t_Co=256
endif
" ビープ音に音もフラッシュも使わない
set visualbell
set t_vb=
" カーソル行を強調
set cursorline
" モードラインを有効化
set modeline

" タブ・インデント関連

" インデントに使われる空白の数
set shiftwidth=2
" タブが対応する空白の数
set tabstop=2
" タブの代わりに空白を使う
set expandtab
" タブ幅として使用する空白の数
set softtabstop=2
" インデントをshiftwidthの値の倍数に丸める
set shiftround
" 新しい行のインデントを現在の行と同じにする
set autoindent

""""""""""""""""""""""""""""""""""""""""
" カラースキーム

set background=dark
colorscheme jellybeans

""""""""""""""""""""""""""""""""""""""""
" キーマップ

" LeaderをSpaceキーにする
" http://postd.cc/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"

" Yで行末までヤンクする
nnoremap Y y$
" Enterで改行を挿入する
noremap <CR> o<Esc>
" <Esc>2回でハイライトOFF
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
" コロンとセミコロンの入れ替え
noremap ; :
noremap : ;
" 上下のカーソル移動を表示行で（物理行は<C-n><C-p>を使う）
nnoremap j gj
nnoremap k gk
" C-jでノーマルモードに
inoremap <C-j> <Esc>
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
" F5でタグファイルを作成
nnoremap <F5> :!ctags -R<CR>
" 分割ウィンドウにtagジャンプ
" http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
nnoremap <A-]> :vsplit<CR>:exec("tag " . expand("<cword>"))<CR>

" Leaderとの組み合わせ
" 保存
nnoremap <silent> <Leader>w :w<CR>

""""""""""""""""""""""""""""""""""""""""
" itchyny/lightline.vim

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

""""""""""""""""""""""""""""""""""""""""
" ctrlpvim/ctrlp.vim

let g:ctrlp_cmd = 'CtrlPBuffer'

""""""""""""""""""""""""""""""""""""""""
" davidhalter/jedi-vim

augroup my-vimrc
  autocmd!
  " 補完中にdocstringウィンドウをポップアップしない
  autocmd FileType python setlocal completeopt-=preview
augroup END

""""""""""""""""""""""""""""""""""""""""
" scrooloose/syntastic

let g:syntastic_python_checkers = ['python', 'flake8']


""""""""""""""""""""""""""""""""""""""""
" nathanaelkane/vim-indent-guides

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 1

""""""""""""""""""""""""""""""""""""""""
" Rykka/riv.vim

let s:loaded_riv_vim = neobundle#get('riv.vim')
if len(s:loaded_riv_vim)
  " projectへのパス
  let s:proj1 = { 'path': s:doc4vim_path . '/riv_vim' }
  let g:riv_projects = [s:proj1]
  " ファイルへのリンクをSphinxスタイルにする
  let g:riv_file_link_style = 2
  " 自動折り畳みをOFF
  let g:riv_fold_auto_update = 0
endif


""""""""""""""""""""""""""""""""""""""""
" majutsushi/tagbar

nnoremap <F8> :TagbarToggle<CR>
