local M = {}

function M.config()
	-- Setup nvim-cmp.
	local cmp = require 'cmp'
	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				-- luasnip
				--require('luasnip').lsp_expand(args.body)
				-- vsnip
				 vim.fn["vsnip#anonymous"](args.body)
				-- snippy
				 --require('snippy').expand_snippet(args.body)
				-- ultisnip
				-- vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		--mapping = {
			--['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			--['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			--['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			--['<C-y>'] = cmp.config.disable,
			--['<C-e>'] = cmp.mapping({
				--i = cmp.mapping.abort(),
				--c = cmp.mapping.close(),
			--}),
			---- Accept currently selected item...
			---- Set `select` to `false` to only confirm explicitly selected items:
			--['<CR>'] = cmp.mapping.confirm({ select = true }),
		--},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			 { name = 'luasnip' }, -- For luasnip users.
			-- { name = 'ultisnips' }, -- For ultisnips users.
			 { name = 'snippy' }, -- For snippy users.
		}, { { name = 'buffer' } }),
		--window = {
			--completion = {
			--winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			--col_offset = -3,
			--side_padding = 0,
			--},
		--},
		--formatting = {
			--format = function(entry, item)
				--item.kind = lsp_symbols[item.kind]
				--item.menu = ({
					--buffer = "[Buffer]",
					--nvim_lsp = "[LSP]",
					--luasnip = "[Snippet]",
					--neorg = "[Neorg]",
				--})[entry.source.name]

				--return item
			--end,
		--},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
	})

	-- You can also set special config for specific filetypes:
	--    cmp.setup.filetype('gitcommit', {
	--        sources = cmp.config.sources({
	--            { name = 'cmp_git' },
	--        }, {
	--            { name = 'buffer' },
	--        })
	--    })

	-- nvim-cmp for commands
	cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end
	local feedkey = function(key, mode)
	  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end

	local luasnip = require("luasnip")
	local snippy = require("snippy")
	local cmp = require("cmp")

	cmp.setup({
		mapping = {
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

			['<C-k>'] = cmp.mapping.select_prev_item(),
			['<Up>'] = cmp.mapping.select_prev_item(),
			-- 下一个
			['<C-j>'] = cmp.mapping.select_next_item(),
			['<Down>'] = cmp.mapping.select_next_item(),
			-- 出现补全
			--['<C-h>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			---- 取消
			--['<CR>'] = cmp.mapping({
			  --i = cmp.mapping.abort(),
			  --c = cmp.mapping.close(),
			--}),
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			--['<CR>'] = cmp.mapping.confirm({
			  --select = true ,
			  --behavior = cmp.ConfirmBehavior.Replace
			--}),
			['<S-Tab>'] = cmp.mapping.select_prev_item(),
			['<Tab>'] = cmp.mapping.select_next_item(),
			--["<Tab>"] = cmp.mapping(function(fallback)
				--if cmp.visible() then
					--cmp.select_next_item()
				--elseif snippy.can_expand_or_advance() then
					--snippy.expand_or_advance()
				--elseif has_words_before() then
					--cmp.complete()
				--else
					--fallback()
				--end
				--end, { "i", "s" }),

			--["<S-Tab>"] = cmp.mapping(function(fallback)
				--if cmp.visible() then
					--cmp.select_prev_item()
				--elseif snippy.can_jump(-1) then
					--snippy.previous()
				--else
					--fallback()
				--end
				--end, { "i", "s" }),
			-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			--['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			--['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			-- ... Your other mappings ...
		},

		-- ... Your other configuration ...
	})

	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	require('lspconfig')['gopls'].setup {
		capabilities = capabilities
	}

	-- nvim-lspconfig config
	-- List of all pre-configured LSP servers:
	-- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	require 'lspconfig'.gopls.setup {}
	local servers = { 'ccls', 'html', 'tsserver', 'rust_analyzer', 'bashls', 'pyright', 'gopls', 'sumneko_lua' }
	for _, lsp in pairs(servers) do
		require('lspconfig')[lsp].setup {
			on_attach = on_attach
		}
	end

	local devicons = require('nvim-web-devicons')
	cmp.register_source('devicons', {
		complete = function(_, _, callback)
			local items = {}
			for _, icon in pairs(devicons.get_icons()) do
				table.insert(items, {
					label = icon.icon .. '  ' .. icon.name,
					insertText = icon.icon,
					filterText = icon.name,
				})
			end
			callback({ items = items })
		end,
	})

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
	--cmp.setup {
		--window = {
			--completion = {
			--winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			--col_offset = -3,
			--side_padding = 0,
			--},
		--},
		--formatting = {
			--format = function(entry, item)
				--item.kind = lsp_symbols[item.kind]
				--item.menu = ({
					--buffer = "[Buffer]",
					--nvim_lsp = "[LSP]",
					--luasnip = "[Snippet]",
					--neorg = "[Neorg]",
				--})[entry.source.name]

				--return item
			--end,
		--},
		----formatting = {
			----fields = {"kind", "abbr", "menu"},
			----format = lspkind.cmp_format({
				----mode = 'symbol', -- show only symbol annotations
				----maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

				------ The function below will be called before any actual modifications from lspkind
				------ so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
				----before = function(_, vim_item)
					----return vim_item
				----end
			----})
		----}
		--snippet = {
			--expand = function(args)
				--luasnip.lsp_expand(args.body)
			--end,
		--},
	--}

end

return M
