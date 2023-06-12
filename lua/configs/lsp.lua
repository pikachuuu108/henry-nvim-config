------------------------------------------------------------------------
--                                lsp                                 --
------------------------------------------------------------------------
-- It's important that you set up the plugins in the following order:
local M = {}
function M.config()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local null_ls = require("null-ls")

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
        }
    })
    mason_lspconfig.setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        --["rust_analyzer"] = function ()
        --require("rust-tools").setup {}
        --end
    }


    null_ls.setup({
        sources = {
            null_ls.builtins.code_actions.refactoring,
            --null_ls.builtins.code_actions.shellcheck,
            --null_ls.builtins.diagnostics.checkmake,
            --null_ls.builtins.diagnostics.commitlint,
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.diagnostics.golangci_lint,
            null_ls.builtins.completion.spell,
            --null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.beautysh,
            null_ls.builtins.formatting.black, -- python
            --null_ls.builtins.formatting.shfmt, -- bash
            null_ls.builtins.formatting.gofmt, -- golang
            null_ls.builtins.formatting.json_tool,
            null_ls.builtins.hover.dictionary,
            null_ls.builtins.hover.printenv,
        },
    })
end

return M
