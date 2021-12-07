local map = require('utils').map

require('mapx').setup{ global = true }

-- Better pane movements
nmap('<c-h>', '<c-w>h')
nmap('<c-j>', '<c-w>j')
nmap('<c-k>', '<c-w>k')
nmap('<c-l>', '<c-w>l')

-- Map space to leader
vim.g.mapleader=' '
-- local g = vim.g
-- map('n', '<space>', '<nop>')
-- map('v', '<space>', '<nop>')
-- g.mapleader = ' '
-- g.maplocalleader = '\\'

-- Prevent x from overriding the clipboard
-- nmap('x', '"_x')
-- nmap('X', '"_X')

-- Open last buffer
nmap('<leader><leader>', '<c-^>')
-- Quit the buffer
nmap('<leader>q', ':quit<cr>', silent)


-- nmap('<leader>h', ':YankHistoryRgPaste<Cr>')
-- nmap ]r :!npm run repl %:p<cr>
-- nmap ]t :!npm run lint %:p<cr>
-- nmap ]y :!npm run test %:p<cr>

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
