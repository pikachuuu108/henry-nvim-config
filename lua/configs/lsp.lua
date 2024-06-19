------------------------------------------------------------------------
--                                lsp                                 --
------------------------------------------------------------------------
-- It's important that you set up the plugins in the following order:
local M = {}
function M.config()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    --local null_ls = require("null-ls")

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
            --"clang-format",
            "clangd",
            "dockerls",
            --"cpplint",
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

    require('lint').linters_by_ft = {
        markdown = { 'vale', },
        cpp = { 'cpplint' },
        python = { 'pylint' },
    }

    vim.cmd [[ au BufWritePost * lua require('lint').try_lint() ]]
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
            -- try_lint without arguments runs the linters defined in `linters_by_ft`
            -- for the current filetype
            require("lint").try_lint()

            -- You can call `try_lint` with a linter name or a list of names to always
            -- run specific linters, independent of the `linters_by_ft` configuration
            --require("lint").try_lint("cspell")
        end,
    })


    --null_ls.setup({
    --sources = {
    --null_ls.builtins.code_actions.refactoring,
    ----null_ls.builtins.code_actions.shellcheck,
    ----null_ls.builtins.diagnostics.checkmake,
    ----null_ls.builtins.diagnostics.commitlint,
    --null_ls.builtins.diagnostics.flake8,
    --null_ls.builtins.diagnostics.golangci_lint,
    --null_ls.builtins.completion.spell,
    ----null_ls.builtins.formatting.stylua,
    --null_ls.builtins.formatting.beautysh,
    --null_ls.builtins.formatting.black, -- python
    ----null_ls.builtins.formatting.shfmt, -- bash
    --null_ls.builtins.formatting.gofmt, -- golang
    --null_ls.builtins.formatting.json_tool,
    --null_ls.builtins.hover.dictionary,
    --null_ls.builtins.hover.printenv,
    --},
    --})

    local util = require("formatter.util")

    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require("formatter").setup {
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
            -- Formatter configurations for filetype "lua" go here
            -- and will be executed in order
            lua = {
                -- "formatter.filetypes.lua" defines default configurations for the
                -- "lua" filetype
                require("formatter.filetypes.lua").stylua,

                -- You can also define your own configuration
                function()
                    -- Supports conditional formatting
                    if util.get_current_buffer_file_name() == "special.lua" then
                        return nil
                    end

                    -- Full specification of configurations is down below and in Vim help
                    -- files
                    return {
                        exe = "stylua",
                        args = {
                            "--search-parent-directories",
                            "--stdin-filepath",
                            util.escape_path(util.get_current_buffer_file_path()),
                            "--",
                            "-",
                        },
                        stdin = true,
                    }
                end
            },

            -- Use the special "*" filetype for defining formatter configurations on
            -- any filetype
            ["*"] = {
                -- "formatter.filetypes.any" defines default configurations for any
                -- filetype
                require("formatter.filetypes.any").remove_trailing_whitespace
            }
        }
    }
end

return M
