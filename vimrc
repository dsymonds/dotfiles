execute pathogen#infect()

syntax enable

colorscheme elflord

filetype indent on
filetype plugin on
set backspace=2
set incsearch
set hlsearch
set nobackup
set nowb
set wildmode=longest,list
set noequalalways

" Indenting
set autoindent
set shiftwidth=2
set expandtab
set cinoptions=11,g0.5s,h0.5s,i2s,+2s,(0,W2s
imap <TAB> <C-V><TAB>

set nohidden

" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set nomodeline

" Status line
set laststatus=2
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set statusline=%f:%l:%c%m%r%=line\ %l/%L\ %P

" Don't use two spaces after a period.
:set nojoinspaces

" Go
let g:go_disable_autoinstall = 1
let g:go_play_open_browser = 0
let g:go_fmt_command = "gofmt"
:autocmd BufRead,BufNewFile *.go set sw=8 ts=8 noexpandtab
:autocmd BufRead,BufNewFile *.go.golden set sw=8 ts=8 noexpandtab

" When editing Go, use "go build" as the makeprg.
:autocmd BufRead,BufNewFile *.go set makeprg=go\ build

" Terraform
let g:terraform_fmt_on_save=1

" Protocol buffers
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
":autocmd BufRead,BufNewFile *.proto setfiletype proto

:autocmd BufRead,BufNewFile *.yaml set sw=2 ts=2 expandtab nolist

" Lint
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")

runtime ftplugin/man.vim

" TypeScript
:autocmd BufRead,BufNewFile *.tsx set sw=2 ts=2 expandtab

function! s:GitGrep(pat)
  " TODO: find git root, or prevent chdir?
  cgetexpr system("git grep --line-number --column --no-color " . a:pat)
  cwin
  echo "Found " . len(getqflist()) . " matches."
endfunction
command! -nargs=1 GitGrep :call s:GitGrep(<f-args>)

" Use ripgrep as :grep.
if executable('rg')
  set grepprg=rg\ --vimgrep\ --hidden
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
