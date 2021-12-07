local map = require('utils').map

local silent = {silent = true}

vim.api.nvim_command('set signcolumn=yes')
vim.api.nvim_command('set relativenumber')
vim.api.nvim_command('set nu rnu') -- hybrid line numbers
vim.api.nvim_command('set scrolloff=5') -- always display 5 lines around cursor
vim.api.nvim_command('set nofixendofline')
vim.api.nvim_command('set undolevels=5000') -- set maximum undo levels
vim.api.nvim_command('set undofile') -- preserves undo history per file, through closing and opening
vim.api.nvim_command('set nowrap') -- disable wrap for long lines
vim.api.nvim_command('set ignorecase') -- ignore case of letters
vim.api.nvim_command('set smartcase') -- override the 'ignorecase' when there is uppercase letters
vim.api.nvim_command('set gdefault') -- when on, the :substitute flag 'g' is default on
-- vim.api.nvim_command('set colorcolumn=80')
vim.api.nvim_command('set clipboard+=unnamedplus')
vim.api.nvim_command('set cursorline')
vim.api.nvim_command('set hidden')
vim.api.nvim_command('set expandtab') -- replace <Tab with spaces
vim.api.nvim_command('set tabstop=2') -- number of spaces that a <Tab> in the file counts for
vim.api.nvim_command('set softtabstop=2') -- remove <Tab> symbols as it was spaces
vim.api.nvim_command('set shiftwidth=2') -- indent size for << and >>
vim.api.nvim_command('set shiftround') -- round indent to multiple of 'shiftwidth' (for << and >>)
vim.api.nvim_command('set formatoptions+=nj')
vim.api.nvim_command('set hlsearch incsearch') -- turns on highlighting search results and searching as you type.

vim.opt.termguicolors = true
-- require("bufferline").setup{}

vim.api.nvim_command('let g:startify_change_to_dir=0')
vim.api.nvim_command('let g:startify_change_to_vcs_root = 1')


vim.api.nvim_command('hi StatusLine guibg=NONE ')


