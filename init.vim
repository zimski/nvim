call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'lifepillar/gruvbox8'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'

Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/vim-closer'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-rails'
Plug 'vim-test/vim-test'
Plug 'kassio/neoterm'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

Plug 'chaoren/vim-wordmotion'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'ThePrimeagen/harpoon'
call plug#end()

colorscheme gruvbox
set background=dark

syntax on

set ignorecase
" set hidden
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set inccommand=split



if executable('rg')
  let g:rg_derive_root='true'
endif
let g:gitgutter_map_keys = 0
let loaded_matchparen = 1
let mapleader = " "
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_fastbrowse = 0 
let g:ctrlp_working_path_mode = 'ra'

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_smart_case = 1
" Avoid showing message extra message when using completion
set shortmess+=c


" tests terminal 
let test#strategy = "neoterm"
let g:neoterm_default_mod= ':botright'
let g:neoterm_size= 10
let g:neoterm_autoscroll= 1

" custom chakib config
let g:user_emmet_leader_key=','

call git#init()
call mapping#init()

highlight TelescopeMatching       guifg=#fabd2f
highlight TelescopeSelection      guifg=#D79921 gui=bold " selected item


" Auto-format *.rs (rust) files prior to saving them
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)


:lua << END
require'zimo.lsp'
require'nvim-treesitter.configs'.setup {
indent = {
    enable = true
    },
    highlight = {
  enable = false,              -- false will disable the whole extension
  disable = { "c", "rust", "yaml", "json" },  -- list of language that will be disabled
  },
  }

  local actions = require('telescope.actions')
  require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
    prompt_prefix = ">",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = { ".git"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
END
