"vim.o.termguicolors = true

lua <<EOF
vim.o.termguicolors = true
EOF


set number
"set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin('~/.config/nvim/autoload/plugged')
    "One Dark theme
    Plug 'joshdick/onedark.vim'
    
    "Nordic theme
    Plug 'arcticicestudio/nord-vim'
    "Plug 'shaunsingh/nord.nvim'
    
    "CSS colorizer plugins
    Plug 'norcalli/nvim-colorizer.lua'
    "Plug 'gko/vim-coloresque'
    "Plug 'ap/vim-css-color'
    "Plug 'chrisbra/colorizer'
    
    "Plugin for smooth scrolling
    Plug 'karb94/neoscroll.nvim'
    
    "Sexy Startpage
    Plug 'mhinz/vim-startify'

    
    "Vim minimap
    "Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

    "Nvim Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    "Statusline
    Plug 'hoob3rt/lualine.nvim'
    " Icons for Statusline
    Plug 'kyazdani42/nvim-web-devicons'


    " Better Syntax Support
    "Plug 'sheerun/vim-polyglot'
    
    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'ryanoasis/vim-devicons'

    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    Plug 'Yggdroot/indentLine'

    " Stable version of coc
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    "Neovim Native LSP
    Plug 'neovim/nvim-lspconfig'
    "Plug 'hrsh7th/nvim-compe'
    "Plug 'kabouzeid/nvim-lspinstall'

    
    " Install nvim-cmp
    Plug 'hrsh7th/nvim-cmp'
    "Install nvim-lsp completion engine
    Plug 'hrsh7th/cmp-nvim-lsp'
    " Install snippet engine (This example installs [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip))
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

    "Install path completion engine
    Plug 'hrsh7th/cmp-path'
    " Install the buffer completion engine
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-cmdline'


    Plug 'saadparwaiz1/cmp_luasnip'

    Plug 'L3MON4D3/LuaSnip'
    
    "Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }

    " (Optional) Multi-entry selection UI.
    "Plug 'junegunn/fzf'


    Plug 'morhetz/gruvbox'

    "Plug 'nightsense/strawberry'
    Plug 'ryanoasis/vim-devicons'


    "LSPinstall
    "Plug 'williamboman/nvim-lsp-installer'

    "Vscode like icons for cmp
    Plug 'onsails/lspkind-nvim'
    
    "Float terminal
    Plug 'voldikss/vim-floaterm'

    Plug 'rafamadriz/friendly-snippets'

    Plug 'github/copilot.vim'
    "Plug 'dag/vim-fish'
    
call plug#end()


lua require'colorizer'.setup()


":let g:colorizer_auto_color = 1

"set guifont= SauceCodePro\ Nerd\ Font:h18
set guifont=SauceCodePro\ Nerd\ Font:h20
set clipboard=unnamedplus
set mouse=nicr
set mouse=a


"set completeopt+=popup


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-a> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

luafile ~/.config/nvim/scroll-config.lua

"colorscheme
colorscheme onedark


"Lua line config
lua <<EOF
require('lualine').setup{options = {theme = 'onedark'}}    
EOF

"Minimap Config
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

"Native LSP and autocompletion config in lua
source ~/.config/nvim/lsp/nvim-lsp-config.vim
"luafile ~/.config/nvim/lsp/compe-config.lua
"luafile ~/.config/nvim/lsp/lspinstall-config.lua
"luafile ~/.config/nvim/lsp/cmp-config.lua


"Language server configs in lua
luafile ~/.config/nvim/lsp/go-lsp.lua
luafile ~/.config/nvim/lsp/python-lsp.lua
luafile ~/.config/nvim/lsp/rust-lsp.lua
"luafile ~/.config/nvim/lsp/c-lsp.lua
luafile ~/.config/nvim/lsp/html-lsp.lua

"Treesitter config in lua
luafile ~/.config/nvim/treesitter-config.lua


"cmp config file in vim script along with fuzzy matching
source ~/.config/nvim/lsp/cmp-config.vim
":hi CmpItemAbbrMatchFuzzy guifg=#fe8019
:hi CmpItemAbbrMatchFuzzy guifg=#e06c7f



"Small lua snippet for testing language servers
lua << EOF
require'lspconfig'.julials.setup{}
EOF



" Vsnip snippet engine config

" NOTE: You can use other key to expand snippet.
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
"let g:vsnip_filetypes.c = ['c']


lua << EOF
local g = vim.g
local fn = vim.fn
local map = vim.api.nvim_set_keymap

--g.vsnip_snippet_dir = fn.expand('~/.config/nvim/vsnip')

EOF



"Floating terminal configs
nnoremap <A-t> :FloatermNew fish<CR>
let g:floaterm_autoclose = 1
let g:floaterm_keymap_toggle = '<F12>'

