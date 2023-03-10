vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        -- 中文文档
        use 'yianwillis/vimcdoc'
        -- nvim-tree
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {'nvim-tree/nvim-web-devicons' -- optional, for file icons
            }
        }
        -- bufferline
        use {
            "akinsho/bufferline.nvim",
            requires = 'kyazdani42/nvim-web-devicons',
            config = function()
                require("conf.bufferline")
            end
        }
        -- git
        use 'airblade/vim-gitgutter' -- TODO: better git integration
        -- theme
        use 'folke/tokyonight.nvim'
        -- telescope
        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.0',
            requires = {{'nvim-lua/plenary.nvim'}},
            config = function()
                require('conf.telescope')
            end
        }
        -- startup screen
        use {
            'goolord/alpha-nvim',
            requires = {'kyazdani42/nvim-web-devicons'},
            config = function()
                require('conf.alpha-nvim')
            end
        }
        -- terminal
        use {
            "akinsho/toggleterm.nvim",
            config = function()
                require('conf.toggleterm')
            end
        }
        -- lualine
        use {
            'nvim-lualine/lualine.nvim',
            requires = {
                'kyazdani42/nvim-web-devicons',
                opt = true
            },
            config = function()
                require('conf.lualine')
            end
        }
        -- treesitter highlight
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({
                    with_sync = true
                })
                ts_update()
            end
        }
        -- lsp config
        use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
        -- nvim-cmp
        use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
        use 'hrsh7th/cmp-buffer' -- { name = 'buffer' },
        use 'hrsh7th/cmp-path' -- { name = 'path' }
        use 'hrsh7th/cmp-cmdline' -- { name = 'cmdline' }
        use 'hrsh7th/nvim-cmp'
        -- vsnip
        use 'hrsh7th/cmp-vsnip' -- { name = 'vsnip' }
        use 'hrsh7th/vim-vsnip'
        use 'rafamadriz/friendly-snippets'
        -- lspkind
        use 'onsails/lspkind-nvim'
    end,
    config = {
        display = {
            open_fn = require("packer.util").float
        }
    }
})
