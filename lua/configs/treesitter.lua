local M = {}
function M.config()
	-- nvim-treesitter config
	require 'nvim-treesitter.configs'.setup {
		-- ensure_installed = "maintained", -- for installing all maintained parsers
		ensure_installed = { "c", "cpp", "lua", "python", "go", "gomod", "query", "git_config", "gitcommit", "markdown", "json", "yaml", "bash" }, -- for installing specific parsers
		sync_install = false, -- install synchronously
        auto_install = true,
		ignore_install = {}, -- parsers to not install
		highlight = {
            enable = true,
			additional_vim_regex_highlighting = true, -- disable standard vim highlighting
            --custom_captures = {
                --["punctuation.bracket"] = "",
                --["constructor"]         = "",
            --},
        },
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
            },
        },
        --rainbow = {
            --enable = true,
            ---- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            --extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            --max_file_lines = nil, -- Do not enable for files with more than n lines, int
            ---- colors = {}, -- table of hex strings
            ---- termcolors = {} -- table of colour name strings
        --}
    }
end
return M
