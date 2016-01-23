@echo off

set CURRENT_DIR=%CD%

set VIMRC=%CURRENT_DIR%\vimrc
set GVIMRC=%CURRENT_DIR%\gvimrc
set VIM_DIR=%CURRENT_DIR%\vim
set SETTINGS=%CURRENT_DIR%\settings

set WIN_VIMRC=%USERPROFILE%\_vimrc
set WIN_GVIMRC=%USERPROFILE%\_gvimrc
set WIN_VIM_DIR=%USERPROFILE%\vimfiles
set WIN_SETTINGS=%USERPROFILE%\settings

mklink %WIN_VIMRC% %VIMRC%
mklink %WIN_GVIMRC% %GVIMRC%
mklink /d %WIN_VIM_DIR% %VIM_DIR%
mklink /d %WIN_SETTINGS% %SETTINGS%
