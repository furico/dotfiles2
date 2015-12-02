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
" 個人用wiki
NeoBundle 'vimwiki/vimwiki'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""
" 基本設定

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

""""""""""""""""""""""""""""""""""""""""
" カラースキーム

set background=dark
colorscheme jellybeans

""""""""""""""""""""""""""""""""""""""""
" キーマップ

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
" vimwiki/vimwiki

"let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
