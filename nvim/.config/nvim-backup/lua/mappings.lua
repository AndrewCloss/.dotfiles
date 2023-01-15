require('mapx').setup{ global = true }

-- Better pane movements
nnoremap('<a-n>', '<c-w>h')
nnoremap('<a-e>', '<c-w>j')
nnoremap('<a-i>', '<c-w>k')
nnoremap('<a-o>', '<c-w>l')

-- Map space to leader
vim.g.mapleader=' '

-- Prevent x from overriding the clipboard
-- nmap('x', '"_x')
-- nmap('X', '"_X')

-- Open last buffer
nmap('<leader><leader>', '<c-^>')
-- Save the buffer
nmap('<leader>w', ':write<cr>', silent)
-- Quit the buffer
nmap('<leader>q', ':quit<cr>', silent)

-- keep it centered
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
nnoremap('J', 'mpJ`p')
-- -- Undo break points
-- inoremap , ,<c-g>u
-- inoremap . .<c-g>u
-- inoremap ! !<c-g>u
-- inoremap ? ?<c-g>u
-- -- jumplist mutations
-- nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

-- -- moving text
vnoremap('J', ":m '>+1<CR>gv=gv")
vnoremap('K', ":m '<-2<CR>gv=gv")

nmap('<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]])
nmap('<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]])
nmap('<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]])
nmap('<leader>fp', [[<cmd>lua require'telescope'.extensions.projects.projects{}<cr>]])
nmap('<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]])

nnoremap('gpd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
nnoremap('gpi', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
nnoremap('gP',  "<cmd>lua require('goto-preview').close_all_win()<CR>")

nnoremap('<leader>xx', '<cmd>Trouble<cr>')
nnoremap('<leader>xw', '<cmd>Trouble lsp_workspace_diagnostics<cr>')
nnoremap('<leader>xd', '<cmd>Trouble lsp_document_diagnostics<cr>')
nnoremap('<leader>xl', '<cmd>Trouble loclist<cr>')
nnoremap('<leader>xq', '<cmd>Trouble quickfix<cr>')
nnoremap('gR',         '<cmd>Trouble lsp_references<cr>')

-- Open terminal as a floating window
tnoremap('<c-z>', "<c-\\><c-n>:lua require('terminal').toggle()<CR>")
nnoremap('<c-z>', ":lua require('terminal').toggle()<CR>")

-- Toggle NvimTree
nnoremap('<leader>t', ":NvimTreeToggle<CR>")
