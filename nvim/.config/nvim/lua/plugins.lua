local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

    use ({
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            require('plugins/nvim-tree')
        end,
    })

    use ({
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        },
        event = 'BufEnter',
        config = function()
            require('plugins/lualine')
        end,
    })

    use ({
        'neovim/nvim-lspconfig',
        config = function()
           require('plugins/nvim-lspconfig')
        end,
    })

   use(
       {
           'nvim-treesitter/nvim-treesitter',
           event = 'CursorHold',
           run = ':TSUpdate',
           config = function()
           require('plugins.treesitter')
           end,
       },
       {
           'nvim-treesitter/playground',
           after = 'nvim-treesitter'
       },
       {
           'nvim-treesitter/nvim-treesitter-textobjects',
           after = 'nvim-treesitter'
       },
       {
           'nvim-treesitter/nvim-treesitter-refactor',
           after = 'nvim-treesitter'
       },
       {
           'windwp/nvim-ts-autotag',
           after = 'nvim-treesitter'
       },
       {
           'JoosepAlviste/nvim-ts-context-commentstring',
           after = 'nvim-treesitter'
       }
   )

    use(
        {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim'
            },
            config = function()
                require('plugins/telescope')
            end,
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make'
        }
    )

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
