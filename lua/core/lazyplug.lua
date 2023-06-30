-- packer.nvim
require('lazy').setup({
	'wbthomason/packer.nvim',
    {'neoclide/coc.nvim', branch = 'release'},

	'dstein64/vim-startuptime',
	'lewis6991/impatient.nvim',
	'moll/vim-bbye', -- for more sensible delete buffer cmd

	'sainnhe/sonokai',
	'tiagovla/tokyodark.nvim',
	"rebelot/kanagawa.nvim",


	-- language
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',

	-- buffer
	{
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	},

	-- file tree
	{
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	},

	'saadparwaiz1/cmp_luasnip',
	--use 'L3MON4D3/LuaSnip'
    --
	'dcampos/cmp-snippy',
	'dcampos/nvim-snippy',

	'nvim-treesitter/nvim-treesitter',
	'onsails/lspkind-nvim',
	'rafamadriz/friendly-snippets',

	'ray-x/lsp_signature.nvim',

	-- git
	{
		'lewis6991/gitsigns.nvim',
		tag = 'release',
	},

	-- status line
	{
		'nvim-lualine/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	},

	-- tagbar
	'simrat39/symbols-outline.nvim',

	-- floating terminal
	'voldikss/vim-floaterm',

	-- file telescope
	{
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim'
	},

	-- indent guide
	"lukas-reineke/indent-blankline.nvim",

	-- startup screen
	'leslie255/aleph-nvim',

	-- english grammar check
	'rhysd/vim-grammarous',

	-- black python formatter
    {
        'psf/black',
        branch = 'stable',
    },

	'fatih/vim-go',
	

	{
		'preservim/nerdtree', 
	},
	
	'preservim/tagbar' ,

    'windwp/nvim-autopairs',

    'luochen1990/rainbow',

	'scrooloose/nerdcommenter',

	'junegunn/fzf.vim',
	'junegunn/fzf',
	{ 'ibhagwan/fzf-lua',
	  requires = { 'kyazdani42/nvim-web-devicons' }
	},

    'tpope/vim-fugitive',

    'zivyangll/git-blame.vim',

    'norcalli/nvim-colorizer.lua',

    'ryanoasis/vim-devicons',
    'johnstef99/vim-nerdtree-syntax-highlight',

    'easymotion/vim-easymotion',

    'airblade/vim-gitgutter',

    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
        end
    },

    'kshenoy/vim-signature',

    'honza/vim-snippets',

    'junegunn/vim-easy-align',

    'nvim-treesitter/playground',

    -- lsp
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
    {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { "nvim-lua/plenary.nvim" },
    },

    {
        'python-rope/ropevim',
        ft = "python"
    },

    --use({
    --"folke/noice.nvim",
    --config = function()
        --require("noice").setup({
            ---- add any options here
        --})
    --end,
    --requires = {
        ---- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        --"MunifTanjim/nui.nvim",
        ---- OPTIONAL:
        ----   `nvim-notify` is only needed, if you want to use the notification view.
        ----   If not available, we use `mini` as the fallback
        --"rcarriga/nvim-notify",
        --}
    --})

    ----use 'beauwilliams/statusline.lua'

    --use 'tamton-aquib/staline.nvim'


	-- starup time optimise


	-- themes (disabled other themes to optimize startup time)
	--    use 'joshdick/onedark.vim'
	--    use { 'catppuccin/nvim', as='catppuccin' }
	--    use { 'sonph/onehalf', rtp='vim/' }
	--    use 'liuchengxu/space-vim-dark'
	--    use 'ahmedabdulrahman/aylin.vim'
})
