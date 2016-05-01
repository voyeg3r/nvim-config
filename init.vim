" Criado: Qua 02/Ago/2006 hs 09:19
" Last Change: Dom 01 Mai 2016 08:41:56 BRT
"
"                 ( O O ) Linux User:#423493  
"  +===========oOO==(_)==OOo==============+
"
" https://gregjs.com/vim/2016/do-yourself-a-favor-and-modularize-your-vimrc-init-vim/
" In order to source properly nvim config place this file on: ~/.config/nvim/init.vim
" (you have also this to do: sudo pip3 install neovim)

let g:airline_powerline_fonts = 1
" Map the leader key 
" let mapleader=","

nnoremap ,v :e ~/.config/nvim/init.vim

map <leader>l :set list! <cr>
" to reselect use gv in normal mode
nnoremap <S-F11> <ESC>:set hls!<cr>
inoremap <S-F11> <C-o>:set hls!<cr>
vnoremap <S-F11> <ESC>:set hls!<cr> <bar> gv
nnoremap / :set hls<cr>/

" make copying from visual selection more sane
" source: http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap <expr>y "my\"" . v:register . "y`y"

" togle between number nonumber and relativenumber
" source: http://stackoverflow.com/questions/4387210/vim-how-to-map-two-tasks-under-one-shortcut-key
" source: http://superuser.com/questions/339593/vim-toggle-number-with-relativenumber
nmap <silent> <F11> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" source: http://ddrscott.github.io/blog/2016/vim-toggle-movement/
function! ToggleHomeZero()
    let pos = getpos('.')
    execute "normal! ^"
    if pos == getpos('.')
        execute "normal! 0"
    endif
endfunction
nnoremap 0 :call ToggleHomeZero()<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Sudo to write
cmap w!! w !sudo tee % >/dev/null
command! SaveAsRoot w !sudo tee %

map <silent> <leader>v :e ~/.vimrc<cr>
map <silent> <leader>z :e ~/.zshrc<cr>
" copy current buffer to clipboard
nmap <leader>b :%y+<cr>


nmap n nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" neovim plugins management file
call plug#begin('~/.config/nvim/plugged')

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'edsono/vim-matchit'
Plug 'rking/ag.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'rstacruz/sparkup'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'bling/vim-airline'
Plug 'eparreno/vim-l9'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/VisIncr'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
autocmd! User YouCompleteMe call youcompleteme#Enable()

" Add plugins to &runtimepath
call plug#end()


" index do vim wiki
let g:vimwiki_list = [{'path': '~/.config/nvim/wiki/', 'index': 'main'}]

"
" config for silversearcher ag
let g:agprg="ag --column"
let g:ackprg = 'ag --nogroup --nocolor --column'


set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.


" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).


map <leader>l :set list! <cr>
" to reselect use gv in normal mode
nnoremap <S-F11> <ESC>:set hls!<cr>
inoremap <S-F11> <C-o>:set hls!<cr>
vnoremap <S-F11> <ESC>:set hls!<cr> <bar> gv
nnoremap / :set hls<cr>/


iab -> →
iab tambem também
iab fro for
iab ,m <voyeg3r  gmail.com>
iab mymail <voyeg3r  gmail.com>
iab slas Sérgio Luiz Araújo Silva
iab vc você
iab teh the
iab a. ª
iab analize análise
iab angulo ângulo
iab apos após
iab apra para
iab aqeule aquele
iab aqiulo aquilo
iab arcoíris arco-íris
iab aré até
iab asim assim
iab aspeto aspecto
iab assenção ascenção
iab assin assim
iab assougue açougue
iab aue que
iab augum algum
iab augun algum
iab ben bem
iab beringela berinjela
iab bon bom
iab cafe café
iab caichote caixote
iab capitões capitães
iab cidadães cidadãos
iab ckaro claro
iab cliche clichê
iab compreenssão compreensão
iab comprensão compreensão
iab comun comum
iab con com
iab contezto contexto
iab corrijir corrigir
iab coxixar cochichar
iab cpm com
iab cppara para
iab dai daí
iab danca dança
iab decer descer
iab definitamente definitivamente
iab deshonestidade desonestidade
iab deshonesto desonesto
iab detale detalhe
iab deven devem
iab díficil difícil
iab distingeu distingue
iab dsa das
iab dze dez
iab ecessão exceção
iab ecessões exceções
iab eentão e então
iab emb bem
iab ems sem
iab emu meu
iab en em
iab enbora embora
iab equ que
iab ero erro
iab erv ver
iab ese esse
iab esselência excelência
iab esu seu
iab excessão exceção
iab Excesões exceções
iab excurção excursão
iab Exenplo exemplo
iab exeplo exemplo
iab exijência exigência
iab exijir exigir
iab expontâneo espontâneo
iab ezemplo exemplo
iab ezercício exercício
iab faciu fácil
iab fas faz
iab fente gente
iab ferias férias
iab geito jeito
iab gibóia jibóia
iab gipe jipe
iab ha há
iab hezitação hesitação
iab hezitar hesitar
iab http:\\ http:
iab iigor igor
iab interesado interessado
iab interese interesse
iab Irria Iria
iab isot isto
iab ítens itens
iab ja já
iab jente gente
iab linguiça lingüiça
iab masi mais
iab maz mas
iab con com
iab mema mesma
iab mes mês
iab muinto muito
iab nao não
iab nehum nenhum
iab nenina menina
iab noã não
iab no. nº
iab N. Nº
iab o. º
iab obiter obter
iab observacao observação
iab ons nos
iab orijem origem
iab ospital hospital
iab poden podem
iab portugu6es português
iab potuguês português
iab precisan precisam
iab própio próprio
iab quado quando
iab quiz quis
iab recizão rescisão
iab sanque sangue
iab sao são
iab sen sem
iab sensivel sensível
iab sequéncia seqüência
iab significatimente significativam
iab sinceranete sinceramente
iab sovre sobre
iab susseder suceder
iab tanbem também
iab testo texto
iab téxtil têxtil
iab tydo tudo
iab tuiter http://www.twitter.com/voyeg3r
iab una uma
iab unico único
iab utilise utilize
iab vega veja
iab vivaotux http://vivaotux.blogspot.com
iab vja veja
iab voc6e você
iab wue que
iab xave chave

iab 1a. 1ª
iab 2a. 2ª
iab 3a. 3ª
iab 4a. 4ª
iab 5a. 5ª
iab 6a. 6ª
iab 7a. 7ª
iab 8a. 8ª
iab 9a. 9ª
iab 10a. 10ª
iab 11a. 11ª
iab 12a. 12ª
iab 13a. 13ª
iab 14a. 14ª
iab 15a. 15ª

" caso o teclado esteja desconfigurado use:
"iab 'a á
"iab 'e é
"iab 'i í
"iab 'o ó
"iab ~a ã
"iab ^a â
"iab `a à
"iab ,c ç
"iab ^e ê
"iab ^o ô
"iab ~o õ
"iab 'u ú
