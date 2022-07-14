
local lspkind = require('lspkind')
local cmp = require'cmp'


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['gopls'].setup {
	--capabilities = capabilities
--}
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.insertTextModeSupport = { valueSet = {} } -- TODO
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

require'lspconfig'.vimls.setup {
	flags = {
		debounce_text_changes = 200,
		allow_incremental_sync = true,
	},
	capabilities = capabilities,
}

--require 'lspconfig'.gopls.setup {}
local servers = { 'ccls', 'html', 'tsserver', 'rust_analyzer', 'bashls', 'pyright', 'gopls', 'sumneko_lua' }
for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup {
		--on_attach = on_attach,
		capabilities = capabilities

	}
end

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'
local luasnip = require("luasnip")
local snippy = require("snippy")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			--require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			--require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		--{ name = 'ultisnips' }, -- For ultisnips users.
		{ name = 'snippy' }, -- For snippy users.
	}, { { name = 'buffer' } }),
	window = {
	completion = cmp.config.window.bordered(),
	documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<Up>'] = cmp.mapping.select_prev_item(),
		-- 下一个
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<Down>'] = cmp.mapping.select_next_item(),
		["<C-n>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-Space>'] = cmp.mapping.complete(),
		["<C-p>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif vim.fn["vsnip#jumpable"](1) == 1 then
					feedkey("<Plug>(vsnip-jump-next)", "")
				elseif has_words_before() then
					cmp.complete()
				else
					fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
				end
			end, {"i", "s"}),
		--['<Tab>'] = cmp.mapping.select_next_item(),
		--["<Tab>"] = cmp.mapping(function(fallback)
			--if cmp.visible() then
				--cmp.select_next_item({behavior=cmp.ConfirmBehavior.Insert, select = false})
				----cmp.confirm({behavior=cmp.ConfirmBehavior.Insert, select = false})
			--elseif luasnip.expand_or_jumpable() then
				--luasnip.expand_or_jump()
			--elseif has_words_before() then
				--cmp.complete()
			--else
				--fallback()
			--end
		--end, { "i", "s" }),
		--["<Tab>"] = cmp.mapping(
				--function(fallback)
					--if cmp.visible() then
						--cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
					--elseif require("luasnip").expand_or_jumpable() then
						--vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
					--else
						--fallback()
					--end
				--end, { "i", "s" }
			--),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
	{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
	{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
	{ name = 'path' }
	}, {
	{ name = 'cmdline' }
	})
})

-- Setup lspconfig.
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
	--capabilities = capabilities
--}

local lspkind = require('lspkind')
local lsp_symbols = {
	Text = "   (Text) ",
	Method = "   (Method)",
	Function = "   (Function)",
	Constructor = "   (Constructor)",
	Field = " ﴲ  (Field)",
	Variable = "[] (Variable)",
	Class = "   (Class)",
	Interface = " ﰮ  (Interface)",
	Module = "   (Module)",
	Property = " 襁 (Property)",
	Unit = "   (Unit)",
	Value = "   (Value)",
	Enum = " 練 (Enum)",
	Keyword = "   (Keyword)",
	Snippet = "   (Snippet)",
	Color = "   (Color)",
	File = "   (File)",
	Reference = "   (Reference)",
	Folder = "   (Folder)",
	EnumMember = "   (EnumMember)",
	Constant = " ﲀ  (Constant)",
	Struct = " ﳤ  (Struct)",
	Event = "   (Event)",
	Operator = "   (Operator)",
	TypeParameter = "   (TypeParameter)",
}
cmp.setup {
	--window = {
		--completion = {
		--winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		--col_offset = -3,
		--side_padding = 0,
		--},
	--},
	formatting = {
		format = function(entry, item)
			item.kind = lsp_symbols[item.kind]
			item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				neorg = "[Neorg]",
			})[entry.source.name]

			return item
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
}

require'lsp_signature'.setup {
	bind = true,
	doc_lines = 5,
	floating_window = true,
	hint_enable = false,
	handler_opts = {border = "single"},
	extra_trigger_chars = {"(", ","},
}
-- Setup nvim-cmp.
--local cmp = require 'cmp'
--cmp.setup {
	---- 指定 snippet 引擎
	--snippet = {
	--expand = function(args)
		---- For `vsnip` users.
		----vim.fn["vsnip#anonymous"](args.body)

		---- For `luasnip` users.
		----require('luasnip').lsp_expand(args.body)

		---- For `ultisnips` users.
		---- vim.fn["UltiSnips#Anon"](args.body)

		---- For `snippy` users.
		--require'snippy'.expand_snippet(args.body)
	--end,
	--},
	---- 来源
	--sources = cmp.config.sources({
	--{ name = 'nvim_lsp' },
	---- For vsnip users.
	--{ name = 'vsnip' },
	---- For luasnip users.
	---- { name = 'luasnip' },
	----For ultisnips users.
	---- { name = 'ultisnips' },
	---- -- For snippy users.
	---- { name = 'snippy' },
	--}, { { name = 'buffer' },
		--{ name = 'path' }
	--}),

	---- 快捷键
	--mapping = {
	---- 上一个
	--['<C-k>'] = cmp.mapping.select_prev_item(),
	--['<Up>'] = cmp.mapping.select_prev_item(),
	---- 下一个
	--['<C-j>'] = cmp.mapping.select_next_item(),
	--['<Down>'] = cmp.mapping.select_next_item(),
	---- 出现补全
	--['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
	---- 取消
	--['<A-,>'] = cmp.mapping({
		--i = cmp.mapping.abort(),
		--c = cmp.mapping.close(),
	--}),
	---- Accept currently selected item. If none selected, `select` first item.
	---- Set `select` to `false` to only confirm explicitly selected items.
	--['<CR>'] = cmp.mapping.confirm({
		--select = true ,
		--behavior = cmp.ConfirmBehavior.Replace
	--}),
	----['<Tab>'] = cmp.mapping.confirm({
		----select = true ,
		----behavior = cmp.ConfirmBehavior.Replace
	----}),
	---- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
	--['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
	--['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
	--},
	---- 使用lspkind-nvim显示类型图标
	--formatting = {
	--format = lspkind.cmp_format({
		--with_text = true, -- do not show text alongside icons
		--maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		--before = function (entry, vim_item)
		---- Source 显示提示来源
		--vim_item.menu = "["..string.upper(entry.source.name).."]"
		--return vim_item
		--end
	--})
	--},
--}

---- Use buffer source for `/`.
--cmp.setup.cmdline('/', {
	--sources = {
	--{ name = 'buffer' }
	--},
	--mapping = cmp.mapping.preset.cmdline(),
--})

---- Use cmdline & path source for ':'.
--cmp.setup.cmdline(':', {
	--sources = cmp.config.sources({
	--{ name = 'path' }
	--}, {
		--{ name = 'cmdline' }
	--}),
	--mapping = cmp.mapping.preset.cmdline(),
--})
