set nocompatible
set number " 行番号表示
set cursorline " カーソル行をハイライト表示
set whichwrap=b,s,h,l,<,>,[,],~ " 行頭・行末から前の行と次の行への移動ができる
set showmode " 現在のモードを表示
set showcmd " 入力したコマンドをステータスラインの下に表示
set history=1000 " 保存するコマンド履歴の件数
set laststatus=2 " ファイル名を表示する
set wildmode=list:longest,full "ファイル名を補完する
set fileformats=unix

" 検索
set ignorecase " 検索パターンに大文字と小文字を区別しない
set smartcase " 検索パターンに大文字が含まれていたら大文字と小文字を区別する
set hlsearch " 検索結果をハイライト
set incsearch " 1文字入力毎に検索を行う
" Escキー2回クリックで検索結果のハイライトのオン・オフを切り替える
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set showmatch " 括弧の対応関係をハイライトする

set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=4 "自動インデントでずれる幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set binary noeol " ファイル保存時にファイル末尾に改行を追加しない

" pasteモードを有効にすると自動インデントが無効になるのでコメントアウトする
"set paste " ペーストモードにする（ペースト時に自動でインデントされない）

filetype indent on

syntax on
set nowrap " 折り返しなしで表示する
"colorscheme darkblue

:retab!
