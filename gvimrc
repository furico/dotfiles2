scriptencoding utf-8

""""""""""""""""""""""""""""""""""""""""
" 基本設定

" クリップボードをOSと連携
if has("unix") && !has("mac")
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" 透過設定
if has("kaoriya")
  set transparency=20
endif

""""""""""""""""""""""""""""""""""""""""
" カラースキーム

set background=dark
colorscheme jellybeans

""""""""""""""""""""""""""""""""""""""""
" ローカルな設定

if filereadable($HOME . "/settings/gvimrc_local")
  source ~/settings/gvimrc_local
endif
