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

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
  })

  use 'wbthomason/packer.nvim'
  use 'tpope/vim-commentary'
  use 'ellisonleao/gruvbox.nvim'
  use 'dracula/vim'
  use { "catppuccin/nvim", as = "catppuccin" }

  --everforest colorscheme
  use({
  "neanias/everforest-nvim",
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup()
  end,
})


  --dashboard

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}

  -- use 'nvim-lualine/lualine.nvim'


  --nougat status line
  use({
  "MunifTanjim/nougat.nvim",
})


  --hardline status line
  -- use {'ojroques/nvim-hardline'}

  use 'nvim-treesitter/nvim-treesitter'
  use 'bluz71/vim-nightfly-colors'
  use 'vim-test/vim-test'
  use 'nvim-tree/nvim-web-devicons'
  use 'lewis6991/gitsigns.nvim'
  use 'kkharji/lspsaga.nvim'   
  use 'tpope/vim-fugitive'
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
  use 'RRethy/vim-illuminate'
  --terminal integration
  use "numToStr/FTerm.nvim"

  use 'onsails/lspkind.nvim'

  use "ray-x/lsp_signature.nvim"
  --colorize 
  use 'brenoprata10/nvim-highlight-colors'

  use 'tpope/vim-surround'
  use 'stevearc/oil.nvim'
  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"
  
  use 'SirVer/ultisnips'
 
  use 'quangnguyen30192/cmp-nvim-ultisnips'


  use "github/copilot.vim"

  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim"
  })
  use 'windwp/nvim-ts-autotag'
  

  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  use 'MunifTanjim/prettier.nvim'
  use({
      "vinnymeller/swagger-preview.nvim",
      run = "npm install -g swagger-ui-watcher",
  })

  use({
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
