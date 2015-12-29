" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" http://docs.python-guide.org/en/latest/dev/env/#text-editors
setlocal textwidth=79  " lines longer than 79 columns will be broken
setlocal shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
setlocal tabstop=4     " a hard TAB displays as 4 columns
setlocal expandtab     " insert spaces when hitting TABs
setlocal softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
setlocal shiftround    " round indent to multiple of 'shiftwidth'
setlocal autoindent    " align the new line indent with the previous line
