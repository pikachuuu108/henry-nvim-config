--vim.g.mapleader = '\<space>'
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.keymap.set('n', '<leader><ESC>', ':noh<cr>')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'gk', 'k')

-- black
vim.keymap.set('n', 'ff', 'Black<cr>')

vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- keymaps
-- f: file tree
vim.keymap.set('n', '<F3>', ':NERDTreeToggle<cr>')
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<cr>')
--vim.keymap.set('n', '<F3>', ':NvimTreeToggle<cr>')
--vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<cr>')
--vim.keymap.set('n', '<leader>ft', ':NvimTreeFindFile<cr>')
--vim.keymap.set('n', '<leader>ff', ':NvimTreeFocus<cr>')
--
vim.keymap.set("n", '<F8>', ':TagbarToggle<CR>')
-- y: telescope
vim.keymap.set('n', '<F9>', function() require'telescope.builtin'.find_files{} end)
vim.keymap.set('n', '<F10>', function() require'telescope.builtin'.git_files{} end)
vim.keymap.set('n', '<F11>', function() require'telescope.builtin'.buffers{} end)
vim.keymap.set({'n', 'i'}, '<C-p>', function() require'telescope.builtin'.registers{} end)
-- c: quick command
vim.keymap.set('n', '<leader>ce', ':e<space>')
vim.keymap.set('n', '<leader>cw', ':w<cr>')
vim.keymap.set('n', '<leader>cW', ':wa<cr>')
vim.keymap.set('n', '<leader>cE', ':e!<cr>')
vim.keymap.set('n', '<leader>cq', ':q<cr>')
vim.keymap.set('n', '<leader>cQ', ':q!<cr>')
vim.keymap.set('n', '<leader>cx', ':x<cr>')
-- w: window
vim.keymap.set('n', '<leader>wh', '<c-w>h')
vim.keymap.set('n', '<leader>wj', '<c-w>j')
vim.keymap.set('n', '<leader>wk', '<c-w>k')
vim.keymap.set('n', '<leader>wl', '<c-w>l')
vim.keymap.set('n', '<leader>w1', '<c-w>o')
vim.keymap.set('n', '<leader>wx', ':x<cr>')
vim.keymap.set('n', '<leader>w2', ':sp<cr>')
vim.keymap.set('n', '<leader>w3', ':vs<cr>')
-- window resize
vim.keymap.set('n', '<m-9>', '<c-w><')
vim.keymap.set('n', '<m-0>', '<c-w>>')
vim.keymap.set('n', '<m-->', '<c-w>-')
vim.keymap.set('n', '<m-=>', '<c-w>+')
-- b: buffer
vim.keymap.set('n', '<leader>bn', ':bn<cr>')
vim.keymap.set('n', '<leader>bp', ':bp<cr>')
vim.keymap.set('n', '<leader>d', ':Bdelete<cr>')
--vim.keymap.set('n', '<leader>d', '::bprevious<CR>:bdelete #<CR>')
vim.keymap.set('n', '[b', ':bp<cr>')
vim.keymap.set('n', ']b', ':bn<cr>')
-- p: plugins
vim.keymap.set('n', '<leader>pi', ':PackerInstall<cr>')
vim.keymap.set('n', '<leader>pc', ':PackerClean<cr>')
-- s: search
vim.keymap.set('n', '<leader>ss', '/')
vim.keymap.set('n', '<leader>sw', '/\\<lt>\\><left><left>')
-- l/g/w: language
-- l: general
-- g: goto
-- w: workspace
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>lf', function()
      vim.lsp.buf.format { async = true }
    end)
--vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting)
vim.keymap.set('n', '<leader>lb', ':SymbolsOutline<cr>')
vim.keymap.set('n', '<f4>', ':SymbolsOutline<cr>')

vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration)
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>gn', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references)

vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
-- t: terminal
vim.keymap.set('n', '<leader>tt', ':FloatermToggle<cr>')
vim.keymap.set('n', '<f2>', ':FloatermToggle<cr>')
vim.keymap.set('t', '<f2>', '<c-\\><c-n>:FloatermToggle<return>')
vim.keymap.set('n', '<leader>tn', ':FloatermNew<cr>')
-- h: git
vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<cr>')
vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>')
vim.keymap.set('n', '<leader>hc', ':Gitsigns preview_hunk<cr>')
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<cr>')
vim.keymap.set('n', '<leader>hR', ':Gitsigns reset_buffer')
vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<cr>')
vim.keymap.set('n', '<leader>hd', ':Gitsigns diffthis<cr>')
vim.keymap.set('n', '<leader>hs', ':<C-U>Gitsigns select_hunk<CR>')

-- easymotion
vim.keymap.set('n', 't', '<Plug>(easymotion-f)')
vim.keymap.set('n', 'T', '<Plug>(easymotion-F)')
vim.keymap.set('v', 't', '<Plug>(easymotion-f)')
vim.keymap.set('v', 'T', '<Plug>(easymotion-F)')

-- vim-easy-align
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
