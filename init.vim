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
    Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

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
    "Install path completion engine
    Plug 'hrsh7th/cmp-path'
    " Install the buffer completion engine
    Plug 'hrsh7th/cmp-buffer'

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
    Plug 'williamboman/nvim-lsp-installer'

    "Vscode like icons for cmp
    Plug 'onsails/lspkind-nvim'
    
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
colorscheme gruvbox


"Lua line config
lua <<EOF
require('lualine').setup{options = {theme = 'gruvbox_dark'}}    
EOF

"Minimap Config
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

"Native LSP and autocompletion config in lua
source ~/.config/nvim/lsp/lsp-config.vim
"luafile ~/.config/nvim/lsp/compe-config.lua
luafile ~/.config/nvim/lsp/lspinstall-config.lua
"luafile ~/.config/nvim/lsp/cmp-config.lua


"Language server configs in lua
luafile ~/.config/nvim/lsp/go-lsp.lua
luafile ~/.config/nvim/lsp/python-lsp.lua
luafile ~/.config/nvim/lsp/rust-lsp.lua
luafile ~/.config/nvim/lsp/c-lsp.lua

"Treesitter config in lua
luafile ~/.config/nvim/treesitter-config.lua


set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    CmpItemAbbrMatchFuzzy = { style = 'bold' },
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      {name='path'},
      { name = 'nvim_lsp' },

      -- For vsnip user.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    }
  })

  -- Setup lspconfig.
    local lspkind = require('lspkind')
    cmp.setup {
        formatting = {
        format = lspkind.cmp_format(),
        },
    }
    
EOF

:hi CmpItemAbbrMatchFuzzy guifg=#fe8019

