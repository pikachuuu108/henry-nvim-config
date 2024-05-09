-- packer.nvim
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use { 'neoclide/coc.nvim', branch = 'release' }

    -- starup time optimise
    use 'dstein64/vim-startuptime'
    use 'lewis6991/impatient.nvim'

    -- buffer
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'moll/vim-bbye' -- for more sensible delete buffer cmd

    -- themes (disabled other themes to optimize startup time)
    use 'sainnhe/sonokai'
    use 'tiagovla/tokyodark.nvim'
    --    use 'joshdick/onedark.vim'
    --    use { 'catppuccin/nvim', as='catppuccin' }
    --    use { 'sonph/onehalf', rtp='vim/' }
    --    use 'liuchengxu/space-vim-dark'
    --    use 'ahmedabdulrahman/aylin.vim'
    use "rebelot/kanagawa.nvim"

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- language
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    use 'saadparwaiz1/cmp_luasnip'
    --use 'L3MON4D3/LuaSnip'

    --use 'SirVer/ultisnips'
    --use 'quangnguyen30192/cmp-nvim-ultisnips'

    use 'dcampos/cmp-snippy'
    use 'dcampos/nvim-snippy'

    use 'nvim-treesitter/nvim-treesitter'
    use 'onsails/lspkind-nvim'
    use 'rafamadriz/friendly-snippets'

    use 'ray-x/lsp_signature.nvim'

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
    }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- tagbar
    use 'simrat39/symbols-outline.nvim'

    -- floating terminal
    use 'voldikss/vim-floaterm'

    -- file telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    -- indent guide
    use "lukas-reineke/indent-blankline.nvim"

    -- startup screen
    use 'leslie255/aleph-nvim'

    -- english grammar check
    use 'rhysd/vim-grammarous'

    -- black python formatter
    use {
        'psf/black',
        branch = 'stable',
    }

    use 'fatih/vim-go'


    use {
        'preservim/nerdtree',
    }

    use 'preservim/tagbar'

    use 'windwp/nvim-autopairs'

    use 'luochen1990/rainbow'

    use 'scrooloose/nerdcommenter'

    use 'junegunn/fzf.vim'
    use 'junegunn/fzf'
    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use 'tpope/vim-fugitive'

    use 'zivyangll/git-blame.vim'

    use 'norcalli/nvim-colorizer.lua'

    use 'ryanoasis/vim-devicons'
    use 'johnstef99/vim-nerdtree-syntax-highlight'

    use 'easymotion/vim-easymotion'

    use 'airblade/vim-gitgutter'

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use 'kshenoy/vim-signature'

    use 'honza/vim-snippets'
    use 'norcalli/snippets.nvim'

    use 'junegunn/vim-easy-align'

    use 'nvim-treesitter/playground'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason-lspconfig.nvim'
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }
    use({
        'jose-elias-alvarez/null-ls.nvim',
        requires = { "nvim-lua/plenary.nvim" },
    })

    use {
        'python-rope/ropevim',
        ft = "python"
    }

    use 'kien/ctrlp.vim'

    use 'kawre/leetcode.nvim'

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
end)
