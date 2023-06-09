------------------------------------------------------------------------
--                                lsp                                 --
------------------------------------------------------------------------
-- It's important that you set up the plugins in the following order:
local M = {}
function M.config()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local null_ls = require("null-ls")

    mason.setup()
    mason_lspconfig.setup({
        ensure_installed = {
            "lua_ls",
            "bashls",
            "pyright",
            "jsonls",
            "rome",
        }
    })
    mason_lspconfig.setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name)  -- default handler (optional)
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
            --null_ls.builtins.formatting.stylua,
            --null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.completion.spell,
        },
    })
end

return M
