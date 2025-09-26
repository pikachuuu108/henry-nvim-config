------------------------------------------------------------------------
--                                lsp                                 --
------------------------------------------------------------------------
local M = {}
function M.config()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    
    -- Add LSP capabilities for nvim-cmp
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    mason.setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    mason_lspconfig.setup({
        ensure_installed = {
            "lua_ls",
            "bashls",
            "pyright",
            "ruff",
            "jsonls",
            "yamlls",
            "gopls",
            "ts_ls",
        },
        automatic_installation = true
    })
    

    -- Setup language servers with proper configurations
    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Disable capabilities for servers that shouldn't handle certain features
        -- This prevents duplicate definitions from multiple LSP servers
        local filetype = vim.bo[bufnr].filetype

        -- For Python files, only allow pyright to handle definitions
        if filetype == 'python' then
            if client.name ~= 'pyright' then
                -- Disable definition capabilities for all servers except pyright in Python files
                client.server_capabilities.definitionProvider = false
                client.server_capabilities.declarationProvider = false
                client.server_capabilities.implementationProvider = false
                client.server_capabilities.typeDefinitionProvider = false
                client.server_capabilities.referencesProvider = false
            end
        elseif filetype == 'lua' then
            if client.name ~= 'lua_ls' then
                -- For Lua files, only allow lua_ls to provide definitions
                client.server_capabilities.definitionProvider = false
                client.server_capabilities.declarationProvider = false
                client.server_capabilities.implementationProvider = false
                client.server_capabilities.typeDefinitionProvider = false
                client.server_capabilities.referencesProvider = false
            end
        elseif filetype == 'typescript' or filetype == 'javascript' or filetype == 'typescriptreact' or filetype == 'javascriptreact' then
            if client.name ~= 'ts_ls' then
                -- For TS/JS files, only allow ts_ls to provide definitions
                client.server_capabilities.definitionProvider = false
                client.server_capabilities.declarationProvider = false
                client.server_capabilities.implementationProvider = false
                client.server_capabilities.typeDefinitionProvider = false
                client.server_capabilities.referencesProvider = false
            end
        elseif filetype == 'go' then
            -- For Go files, ensure only gopls provides definitions (not vim-go and gopls both)
            if client.name ~= 'gopls' then
                client.server_capabilities.definitionProvider = false
                client.server_capabilities.declarationProvider = false
                client.server_capabilities.implementationProvider = false
                client.server_capabilities.typeDefinitionProvider = false
                client.server_capabilities.referencesProvider = false
            end
        end

        -- Set up buffer-local keymaps for LSP functionality
        -- NOTE: Avoid setting 'gd' here to prevent duplicate keymaps with the global one
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        -- Do not add 'gd' or 'gD' mappings here to prevent conflicts with global mappings
    end
    
    local util = require 'lspconfig.util'

    -- Setup language servers individually with proper conflict resolution
    local servers = {
        'lua_ls',
        'bashls',
        'pyright',
        'jsonls',
        'yamlls',
        'gopls',
        'ts_ls'
    }

    for _, server_name in ipairs(servers) do
        local server_config = {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        -- Add server-specific configurations
        if server_name == 'lua_ls' then
            server_config.settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.stdpath('config') .. '/lua'] = true,
                        }
                    }
                }
            }
        elseif server_name == 'pyright' then
            server_config.settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true
                    }
                }
            }
        elseif server_name == 'ts_ls' then
            server_config.root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git") or util.path.dirname(vim.loop.cwd())
        elseif server_name == 'gopls' then
            server_config.cmd = {"gopls"}
            server_config.settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                },
            }
        end

        lspconfig[server_name].setup(server_config)
    end

    -- Ruff is already handled in the main loop with proper capability restrictions
    -- The main server loop already includes 'ruff' and handles capability disabling in the on_attach function
    -- No need for a separate ruff setup as it would duplicate the server connection
end

return M
