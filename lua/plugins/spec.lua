return {
    {"wbthomason/packer.nvim"},
    {"neoclide/coc.nvim", branch = "release"},
    -- starup time optimise
    {"dstein64/vim-startuptime"},
    {"lewis6991/impatient.nvim"},
    -- buffer
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        }
    },
    {"moll/vim-bbye"}, -- for more sensible delete buffer cmd
    -- themes (disabled other themes to optimize startup time)
    {"sainnhe/sonokai"},
    {"tiagovla/tokyodark.nvim"},
    {"rebelot/kanagawa.nvim"},
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = {
            "kyazdani42/nvim-web-devicons"
        }
    },
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"},
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-vsnip"},
    {"hrsh7th/vim-vsnip"},
    {"saadparwaiz1/cmp_luasnip"},
    {"L3MON4D3/LuaSnip"},
    {"dcampos/cmp-snippy"},
    {"dcampos/nvim-snippy"},
    {"nvim-treesitter/nvim-treesitter"},
    {"onsails/lspkind-nvim"},
    {"rafamadriz/friendly-snippets"},
    {"ray-x/lsp_signature.nvim"},
    {"lewis6991/gitsigns.nvim", tag = "release"},
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons"
        }
    },

    -- tagbar
    {"simrat39/symbols-outline.nvim"},
    {"voldikss/vim-floaterm"},
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {"lukas-reineke/indent-blankline.nvim"},
    {"rhysd/vim-grammarous"},
    {"psf/black", branch = "stable"},
    {"fatih/vim-go"},

    -- Converted to Lazy.nvim format
    {
        "preservim/nerdtree",
        lazy = true
    },

    {
        "preservim/tagbar",
        lazy = true
    },

    {
        "windwp/nvim-autopairs",
        lazy = true
    },

    {
        "luochen1990/rainbow",
        lazy = true
    },

    {
        "scrooloose/nerdcommenter",
        lazy = true
    },

    {
        "junegunn/fzf.vim",
        lazy = true
    },

    {
        "junegunn/fzf",
        lazy = true
    },

    {
        "ibhagwan/fzf-lua",
        lazy = true,
        dependencies = {
            "kyazdani42/nvim-web-devicons"
        }
    },

    {
        "tpope/vim-fugitive",
        lazy = true
    },

    {
        "norcalli/nvim-colorizer.lua",
        lazy = true
    },

    {
        "ryanoasis/vim-devicons",
        lazy = true
    },

    {
        "johnstef99/vim-nerdtree-syntax-highlight",
        lazy = true
    },

    {
        "easymotion/vim-easymotion",
        lazy = true
    },

    {
        "airblade/vim-gitgutter",
        lazy = true
    },

    {
        "folke/todo-comments.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {}
    },

    {
        "kshenoy/vim-signature",
        lazy = true
    },

    {
        "honza/vim-snippets",
        lazy = true
    },

    {
        "junegunn/vim-easy-align",
        lazy = true
    },

    {
        "nvim-treesitter/playground",
        lazy = true
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        lazy = true
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true
    },

    {
        "williamboman/mason.nvim",
        lazy = true,
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },

    {
        "kawre/leetcode.nvim",
        lazy = true,
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons"
        }
    },

    {
        "kien/ctrlp.vim",
        lazy = true
    },

    {
        "dense-analysis/ale",
        lazy = true
    }
}
