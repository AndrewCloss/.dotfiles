---------- LSP CONFIG ----------

local M = {}
local settings = require('lsp.settings')

---------- MAPPINGS ----------

local mappings = function()
    local keymap = function(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = true
        vim.keymap.set(mode, l, r, opts)
    end

    keymap('n', 'gr', vim.lsp.buf.references, { desc = 'Lsp: References' })
    keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Lsp: Definitions' })
    keymap({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help, { desc = 'Lsp: Signature help' })
    keymap('n', 'gh', vim.lsp.buf.hover, { desc = 'Lsp: Hover' })
    keymap('n', 'gR', vim.lsp.buf.rename, { desc = 'Lsp: Rename' })
    keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Lsp: Code action' })
    keymap('n', 'gp', vim.diagnostic.goto_prev, { desc = 'Lsp: Previous diagnostic' })
    keymap('n', 'gn', vim.diagnostic.goto_next, { desc = 'Lsp: Next diagnostic' })
    keymap('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Lsp: Line diagnostic' })
    keymap('n', '<leader>dw', vim.diagnostic.setqflist, { desc = 'Lsp: Diagnostics in qflist' })
end

---------- SIGNS ----------

local signs = function()
    local sign_define = vim.fn.sign_define
    sign_define('DiagnosticSignError', { text = '✘', texthl = 'DiagnosticSignError' })
    sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
    -- sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
end

M.make_config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
    if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
    end
    return {
        capabilities = capabilities,
        on_attach = function(client)
            require('lsp.handlers').handlers()
            require('lsp.formatting').setup(client)
            mappings()
            signs()
            if client.server_capabilities.signatureHelpProvider then
                require('lsp.signature').setup(client)
            end
            if client.supports_method('textDocument/codeAction') then
                require('lsp.lightbulb').setup()
            end
        end,
    }
end

local servers = {
    -- 'pyright',
    -- 'rust_analyzer',
    'cssls',
    -- 'vimls',
    -- 'texlab',
    'html',
    'bashls',
    -- 'vuels',
    'volar',
    'jsonls',
    -- 'graphql',
    'tsserver',
    'sumneko_lua',
    -- 'clangd',
    -- 'gopls',
    -- 'omnisharp',
    -- 'dockerls',
    'eslint',
    -- 'ltex',
    -- 'grammarly',
}

-- Automatic setup for language servers
local setup_servers = function()
    for _, server in pairs(servers) do
        local config = M.make_config()

        -- Set user settings for each server
        if settings[server] then
            for k, v in pairs(settings[server]) do
                config[k] = v
            end
        end
        require('lspconfig')[server].setup(config)
    end
end

local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if ok then
    lsp_installer.setup({})
end
setup_servers()

return M

-- require("lsp.diagnostics")

-- local nvim_lsp = require('lspconfig')

-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--   -- Enable completion triggered by <c-x><c-o>
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- Mappings.
--   local opts = { noremap=true, silent=true }

--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--   buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--   buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
--   buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- end

-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = { 'tsserver', 'sumneko_lua' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end
-- -- require("lsp.lua")

