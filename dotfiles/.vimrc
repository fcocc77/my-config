" Plugins
    call plug#begin('~/.vim/plugged')

    " Temas
    Plug 'joshdick/onedark.vim'

    " Fuentes e Iconos
    Plug 'ryanoasis/vim-devicons'
    Plug 'ryanoasis/nerd-fonts'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


    " Sintaxis Python
    Plug 'vim-python/python-syntax'

    " Sintaxis para requirements.txt
    Plug 'raimon49/requirements.txt.vim'

    " Sintaxis para archivos .pro
    Plug 'suy/vim-qmake'

    " Sintaxis para to-do Tasks
    Plug 'irrationalistic/vim-tasks'

    " Sintaxis para Javascript y react JSX
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'pangloss/vim-javascript'

    " Sintaxis para c++
    Plug 'bfrg/vim-cpp-modern'

    " Sintaxis MikroTik
    Plug 'zainin/vim-mikrotik'

    " Sintaxis para HasKell
    Plug 'neovimhaskell/haskell-vim'

    " Sintaxis para SASS
    Plug 'cakebaker/scss-syntax.vim'

    " Sintaxis MarkDown
    Plug 'plasticboy/vim-markdown'

    " Sintaxis TypeScript
    Plug 'leafgarland/typescript-vim'

    " Sintaxis YAML
    Plug 'stephpy/vim-yaml'

    " COC
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "Auto Completado

    " Convierte JSON a estructura de GO
    Plug 'meain/vim-jsontogo'

    " AirLine
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Espacios de Trabajo
    Plug 'thaerkh/vim-workspace'

    " Barra de Etiquetas
    Plug 'majutsushi/tagbar'

    " NerdTree
    Plug 'preservim/nerdtree'
    Plug 'xuyuanp/nerdtree-git-plugin' " Muestra los cambios de git en nerdtree

    " Buscador FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter' " Barra lateral que muestra los cambios de Git

    " Completa los signos par como comillas parentesis y otros
    Plug 'jiangmiao/auto-pairs'

    " Resalta los colores en el codigo
    Plug 'lilydjwg/colorizer'

    " Toogle para maximizar sin perder el split
    Plug 'szw/vim-maximizer'

    " Carga los archivos en el buffer si se modifico en otro lugar
    Plug 'djoshea/vim-autoread'

    " Completa par de signos, comillas, parentesis, etc
    Plug 'tpope/vim-surround'

    " Comentarios de codigo
    Plug 'scrooloose/nerdcommenter'

    " Da Formato a archivos c++, con el arhivo .clang-format
    Plug 'rhysd/vim-clang-format'

    " Muestra las lineas de Indentacion
    Plug 'yggdroot/indentline'

    " Folding para todo los lenguajes
    Plug 'pseewald/anyfold'

    call plug#end()
"""

" Extenciones
    " Asigna el tipo de sintxis segun la extencion o nombre
    autocmd BufEnter .xmobarrc :setlocal filetype=haskell
    autocmd BufEnter .xinitrc :setlocal filetype=sh
    autocmd BufEnter *.vina :setlocal filetype=json
    autocmd BufEnter *.conf :setlocal filetype=xf86conf
    autocmd BufEnter *.layout :setlocal filetype=requirements
    autocmd BufEnter *.txt :setlocal filetype=sh
    autocmd BufEnter *.clang-format :setlocal filetype=yaml
    autocmd Bufenter requirements.txt :setlocal filetype=requirements
    autocmd Bufenter go.mod :setlocal filetype=go
    autocmd BufEnter *.vfl :setlocal filetype=cpp
"""

" Configuracion de Plugins

    " MarkDown archivos
    let g:vim_markdown_conceal = 0 " Desabilita la ocultacion"
    let g:vim_markdown_conceal_code_blocks = 0
    """

    " Nerd Commenter
    let g:NERDSpaceDelims = 1 " Agrega un espacio despues del comentario
    au FileType * set fo-=c fo-=r fo-=o " Desabilita el comentario al pasar a la siguiente linea
    """

    " Tag Bar
    let g:tagbar_show_linenumbers = 1
    """

    " Habilita el highlight de python
    let g:python_highlight_all = 1
    ""

    " AutoPair
    let g:AutoPairsMapCh = 0 " desabilita el shortcut Control-h del plugin auto-pairs
    """

    " La sintaxis de json, oculta las comillas, con esta opcion lo desabilitamos esa opcion
    let g:vim_json_conceal=0
    """

    " IndentLine
    let g:indentLine_color_gui = '#3b414d'
    let g:indentLine_char = '▏'
    """

    " Sintaxis JSX
    let g:vim_jsx_pretty_colorful_config = 1 " default 0
    """

    " FZF
    let g:fzf_layout = { 'down': '~40%' } " Abre la venatana en un split en la parte inferior
    ""

    " NerdTree
    let NERDTreeShowLineNumbers = 1 " Habilita los numeros
    let NERDTreeRespectWildIgnore = 1 " Ignora los archivos que estan en 'wildignore'
    let NERDTreeHighlightCursorline = 0 " Desabilita el cursor
    autocmd FileType nerdtree setlocal relativenumber " Numeros relativos
    let g:NERDTreeWinSize = 35
    let NERDTreeShowHidden = 1
    """

" Configuracion VIM
    " Al rodar la barra de scroll del mouse, mueve la pantalla y no el el cursor de vim
    set mouse=a

    " Numeros Laterales
    set number
    set relativenumber

    set encoding=UTF-8

    " habilita la corrección de ortografía en español
    set spelllang=es

    " Para que funcione el borrado con la tecla 'backspace'
    set backspace=indent,eol,start

    " Linea horizontal que muestra donde esta el cursor
    set cursorline

    " Siempre muestra la columna de signos
    set signcolumn=yes

    " Al reescalar vim, siempre mantiene los split del mismo tamaño
    autocmd VimResized * wincmd =

    " Resalta los textos encontrados
    set hlsearch

    " Folding
    filetype plugin indent on
    syntax on
    autocmd Filetype * AnyFoldActivate
    set foldlevel=99
    hi Folded term=underline

    " indentacion
    set expandtab " solo se usan espacios para las tabulaciones
    autocmd BufRead,BufNewFile *.sass set shiftwidth=4 "para que funcione la indentacion en los .sass al leer o al crear un archivo sass
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4

    " Ignorar archivos y carpeta para NerdTree
    set wildignore+=node_modules,*/node_modules/*,*.o,*.swp,*.swo,*.pyc,.git,.undodir,*/.undodir/*,session.vim
    ""

    " Auto guardado de espacio de trabajo
    let g:workspace_session_name = 'session.vim'
    autocmd VimLeave * tabdo NERDTreeClose " Cierra todos los nerdtree antes de salir, por que da conflicto con la session
    autocmd VimLeave * tabdo TagbarClose " Cierra todos los tagbar
    "
"""

" COC
    " Para que el auto completado se pueda cambiar con Tab
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
            elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
        else
            execute '!' . &keywordprg . " " . expand('<cword>')
        endif
    endfunctio

    let g:coc_global_extensions = [ 'coc-json', 'coc-tsserver', 'coc-pyright' , 'coc-go']
"""

" Estilos
    " AirLine
    let g:airline_powerline_fonts = 1 " Para que los rectangulos tengan puntas
    let g:airline_theme = 'onedark'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t' "Solo muestra el nombre en los 'tabs'
    let g:airline#extensions#tabline#show_buffers = 0 " Desabilita el buffer ( historial )
    let g:airline#extensions#tabline#show_splits = 1 " Habilita el buffer de splits que esta a la derecha
    let g:airline#extensions#tabline#tab_nr_type = 1 " Index del tab
    ""

    " Tema
    colorscheme onedark
    set termguicolors " habilita los 24 bit de colores
    set fillchars+=vert:\▏

    au Syntax cpp syn match cOperator "[+=*%^&|<>-]"

    hi CursorLineNr guifg=#fd9845
    hi Folded guifg=#656f80 guibg=#2c333f
"""

" Vim Errores
    " Evita los caracteres feos que aparecen despues de la version 8.22 de vim '>4;2m'
    let &t_TI = ""
    let &t_TE = ""
"""

" ShortCuts
    " leader Tecla
    let mapleader = ","

    " Encuenta 'string' en el archivo actual
    nmap <C-F> :History:<CR>

    " GFiles ignora los archivos de .gitignore
    map <C-P> :GFiles<CR>

    " Toggle WorkSpace
    nnoremap <Leader>ss :ToggleWorkspace<CR>

    " Permite que con el escape se terminen los textos resaltados
    nnoremap <esc> :noh<return><esc>
    nnoremap <esc>^[ <esc>^[

    " Permite copiar hacia el sistema operativo
    vmap <leader>y "+y

    " Toogle para maximizar un ventana el diseño de splits
    let g:maximizer_default_mapping_key = '<F4>'

    " Barra de etiquetas
    nmap <F8> :TagbarToggle<CR>

    " Saltar hacia la definicion
    nmap <silent> <C-]> <Plug>(coc-definition)
    nmap <silent> gr <Plug>(coc-references)

    " Saltar a lineas con errores
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Da formato al codigo
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " Renombra variable o funcion en todas partes donde se este usando
    nmap <leader>rn <Plug>(coc-rename)

    " Visualizar la documentacion o el tipo de dato
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    " Poder navegar con 'lkjh' en modo Insert
    imap <c-k> <up>
    imap <c-j> <down>
    imap <c-h> <left>
    imap <c-l> <right>

    " NerdTree
    nmap <F2> :NERDTreeFind<CR>
    nmap <F3> :NERDTreeToggle<CR>
"""
