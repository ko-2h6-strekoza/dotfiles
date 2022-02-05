"-------------------------------------------------------------------------------
" 基本設定
"-------------------------------------------------------------------------------

" 文字コードをUFT-8に設定
set encoding=utf-8
" backupを作成しない
set nobackup
" swapを作成しない
set noswapfile
" unを作成しない
set noundofile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開く
set hidden
" 入力中のコマンドをステータスに表示
set showcmd
" クリップボードを共有
set clipboard&
set clipboard^=unnamedplus
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動
set virtualedit=onemore
" オートインデント
set autoindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" 10行前からスクロール
set scrolloff=10
" インクリメント処理で10進数を使用
set nf=""
" 折り返し表示の無効化
set nowrap
" カラースキーム
set background=dark
" node js
let g:node_host_prog='/usr/local/bin/neovim-node-host'

"-------------------------------------------------------------------------------
" 検索設定
"-------------------------------------------------------------------------------

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"-------------------------------------------------------------------------------
" インデント設定
"-------------------------------------------------------------------------------

" インデントをタブ化
set expandtab
" スマートタブ
set smarttab
" インデントは半角スペース2つ
set shiftwidth=2
set tabstop=2

" 特定のファイルタイプの場合タブサイズ変更
autocmd FileType java setlocal shiftwidth=4 tabstop=4
autocmd FileType php setlocal shiftwidth=4 tabstop=4

" シンタックスハイライトの閾値を変更
autocmd FileType jsp,html,xml,php syntax sync minlines=500 maxlines=1000

"-------------------------------------------------------------------------------
" キーバインド設定
"-------------------------------------------------------------------------------

" leaderをスペースキーにマップ
let mapleader="\<Space>"
" jjでエスケープ
inoremap <silent> jj <ESC>
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" インクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>
" 全選択
nmap <C-a> gg<S-v>G
" %で対応するタグに移動
source $VIMRUNTIME/macros/matchit.vim

"-------------------------------------------------------------------------------
" dein.vim
"-------------------------------------------------------------------------------
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

set termguicolors
colorscheme gruvbox

