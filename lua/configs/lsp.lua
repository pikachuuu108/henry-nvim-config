------------------------------------------------------------------------
--                                lsp                                 --
------------------------------------------------------------------------
-- It's important that you set up the plugins in the following order:
local M = {}
function M.config()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    -- local null_ls = require("null-ls")
    
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
            --"yaml-language-server",
            "jsonls",
            "rome",
            "yamlls",
            "gopls",
            --"jsonlint",
            --"pylint",
        },
        automatic_installation = true
    })
    
    -- Setup LSP servers manually for now
    require("lspconfig").lua_ls.setup({
        capabilities = capabilities
    })


    -- null_ls.setup({
    --     sources = {
    --         null_ls.builtins.code_actions.refactoring,
    --         --null_ls.builtins.code_actions.shellcheck,
    --         --null_ls.builtins.diagnostics.checkmake,
    --         --null_ls.builtins.diagnostics.commitlint,
    --         --null_ls.builtins.diagnostics.flake8,
    --         null_ls.builtins.diagnostics.golangci_lint,
    --         null_ls.builtins.completion.spell,
    --         --null_ls.builtins.formatting.stylua,
    --         null_ls.builtins.formatting.beautysh,
    --         null_ls.builtins.formatting.black, -- python
    --         --null_ls.builtins.formatting.shfmt, -- bash
    --         null_ls.builtins.formatting.gofmt, -- golang
    --         null_ls.builtins.formatting.json_tool,
    --         null_ls.builtins.hover.dictionary,
    --         null_ls.builtins.hover.printenv,
    --     },
    -- })
end

return M
