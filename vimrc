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
  if has('win32') || has('win64')
    set runtimepath+=~/vimfiles/bundle/neobundle.vim/
  else
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif
endif

" Required:
if has('win32') || has('win64')
  call neobundle#begin(expand('~/vimfiles/bundle/'))
else
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

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
" NeoBundle 'davidhalter/jedi-vim'
" 文法チェッカー
NeoBundle 'scrooloose/syntastic'
" インデントを見やすく
NeoBundle 'nathanaelkane/vim-indent-guides'
" アウトラインビューア(ctagsが必要)
NeoBundle 'majutsushi/tagbar'
" emmet
NeoBundle 'mattn/emmet-vim'

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
set vb t_vb=
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
" ファイルがVimの外部で変更されとき自動的に読み直す
set autoread

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
" nnoremap <F5> :!ctags -R<CR>
" 分割ウィンドウにtagジャンプ
" http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
nnoremap <A-]> :vsplit<CR>:exec("tag " . expand("<cword>"))<CR>

" Leaderとの組み合わせ
" 保存
nnoremap <silent> <Leader>w :update<CR>
" vim-notes
nnoremap <Leader>n :Note<Space>
" ヘルプを縦分割で開く
nnoremap <Leader>h :<C-u>vertical belowright help<Space>
" カレントバッファのファイルをリロードする
nnoremap <silent> <Leader>r :<C-u>call <SID>reload_file()<CR>
function! s:reload_file()
  edit!
  echo 'Reloaded ' . @%
endfunction
" カレントバッファのパスを表示
nnoremap <silent> <Leader>i :<C-u>echo @%<CR>
" カレントバッファのフルパスを表示
nnoremap <silent> <Leader>ii :<C-u>echo expand('%:p')<CR>

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
  " " 補完中にdocstringウィンドウをポップアップしない
  " autocmd FileType python setlocal completeopt-=preview
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
" majutsushi/tagbar

nnoremap <silent> <Leader>t :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""
" Open junk file
" http://vim-jp.org/vim-users-jp/2010/11/03/Hack-181.html

command! -nargs=0 JunkFile call s:open_junk_file(0)
command! -nargs=0 JunkFileTab call s:open_junk_file(1)
function! s:open_junk_file(flg)
  let l:junk_dir = $HOME . '/junk_files' . strftime('/%Y%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir . strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    if a:flg
      execute 'tabnew ' . l:filename
    else
      execute 'edit ' . l:filename
    endif
  endif
endfunction
nnoremap <Leader>j :JunkFile
