local M = {}
function M.config()
	-- nvim-treesitter config
	require 'nvim-treesitter.configs'.setup {
		-- ensure_installed = "maintained", -- for installing all maintained parsers
		ensure_installed = { "c", "cpp", "rust", "lua", "python", "go", "diff" }, -- for installing specific parsers
		sync_install = true, -- install synchronously
        auto_install = true,
		ignore_install = {}, -- parsers to not install
		highlight = {
            enable = true,
			additional_vim_regex_highlighting = false, -- disable standard vim highlighting
            --custom_captures = {
                --["punctuation.bracket"] = "",
                --["constructor"]         = "",
            --},
        },
        incremental_selection = {
            enable = true,
            keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
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
