-- basics
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.termguicolors   = true
vim.opt.shiftround      = true
vim.opt.updatetime      = 100
vim.opt.cursorline      = true
vim.opt.autowrite       = true
if (vim.fn.has('termguicolors') == 1) then
    vim.opt.termguicolors = true
end
-- tabs
vim.opt.autoindent      = true
vim.opt.tabstop         = 4
vim.opt.shiftwidth      = 4
vim.opt.softtabstop     = 4
vim.opt.expandtab       = true

require("core.keymaps")
require("core.plugins")
-- disable some useless standard plugins to save startup time
-- these features have been better covered by plugins
vim.g.loaded_matchparen        = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins    = 1

vim.opt.filetype = "on"
vim.g.do_filetype_lua    = 1
vim.g.did_load_filetypes = 0
require("core.theme")

--vim.g.webdevicons_enable = 1

-- Load plugin configs
-- plugins without extra configs are configured directly here
require("impatient")
require'nvim-autopairs'.setup{}

--require("configs.autocomplete").config()
--require("configs.nvim-cmp").config()
--require("configs.cmp")
--require("configs.git").config()
--require("configs.filetree").config()
--
require("configs.statusline").config()
require("configs.treesitter").config()
require("configs.outlinetree").config()
--require("configs.startscreen").config()
require("configs.bufferline").config()
require("configs.grammar").config()
require("configs.coc-nvim").config()
require("nvim-lsp-installer").setup{}
--require("mason").setup({
    --ui = {
        --icons = {
            --package_installed = "✓",
            --package_pending = "➜",
            --package_uninstalled = "✗"
        --}
    --}
--})

--require("null-ls").setup({
    --sources = {
        ----require("null-ls").builtins.formatting.stylua,
        ----require("null-ls").builtins.diagnostics.eslint,
        --require("null-ls").builtins.formatting.json_tool,
        --require("null-ls").builtins.formatting.black,
        --require("null-ls").builtins.formatting.clang_format,
        --require("null-ls").builtins.formatting.beautysh,
        --require("null-ls").builtins.formatting.gofmt,
        --require("null-ls").builtins.formatting.lua_format,
        --require("null-ls").builtins.formatting.markdownlint,
    --},
--})

require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.yamlls.setup{}

vim.api.nvim_set_keymap('n', '<c-P>',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })

require'colorizer'.setup()
require'colorizer'.setup{
    'python';
    html={
        mode = 'foreground'
    }
}

require("configs.todo-comments").config()
--require("configs.coc-nvim").config()

vim.cmd[[augroup rainbow]]
vim.cmd[[	au BufEnter *     hi      TSPunctBracket NONE]]
vim.cmd[[	au BufEnter *     hi link TSPunctBracket nonexistenthl]]
vim.cmd[[	au BufEnter *.lua hi      TSConstructor  NONE]]
vim.cmd[[	au BufEnter *.lua hi link TSConstructor  nonexistenthl]]
vim.cmd[[augroup END]]

vim.g.gitgutter_preview_win_floating = 1
-- hightlight_lines conflicts with todo-comments
vim.g.gitgutter_highlight_lines = 0
vim.g.gitgutter_highlight_linenrs = 1
