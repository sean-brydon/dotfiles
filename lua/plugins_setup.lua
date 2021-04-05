local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
packer.startup(function()
  local use = use
  use 'airblade/vim-gitgutter'
  use 'itchyny/vim-gitbranch'
  use 'jiangmiao/auto-pairs'
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'
  use 'sainnhe/edge'
  use {'prettier/vim-prettier', run = 'yarn install' }
  use 'tpope/vim-surround'
  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'voldikss/vim-floaterm'
  use 'SirVer/ultisnips'
  use 'alvan/vim-closetag'
  --use 'hrsh7th/vim-vsnip'
  use 'honza/vim-snippets'
  use 'kabouzeid/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'
  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'
  use 'itchyny/lightline.vim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use {
    'akinsho/nvim-bufferline.lua',
        requires = {'kyazdani42/nvim-web-devicons', 'sainnhe/edge'},
        config = require'bufferline_setup',
  }
  use 'tpope/vim-commentary'
  use 'unblevable/quick-scope'
  end
)

-- Starting LSP server
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

