scriptencoding utf-8

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

""""""""""""""""""""""""""""""""""""""""
" プラグイン
""""""""""""""""""""""""""""""""""""""""
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
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'w0ng/vim-hybrid'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""
" 基本設定
""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""
" カラースキーム
""""""""""""""""""""""""""""""""""""""""
set background=dark
autocmd ColorScheme * highlight LineNr ctermfg=darkgray guifg=darkgray
autocmd ColorScheme * highlight VertSplit ctermfg=darkgray guifg=darkgray
colorscheme hybrid

""""""""""""""""""""""""""""""""""""""""
" キーマップ
""""""""""""""""""""""""""""""""""""""""
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
