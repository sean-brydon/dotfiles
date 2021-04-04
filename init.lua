local o=vim.o
local bo=vim.bo
local wo=vim.wo
o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.incsearch = true
o.hidden = true
o.completeopt='menuone,noinsert'
bo.autoindent = true
bo.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = true
vim.g.mapleader=' '
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
require'plugins_setup'

vim.g.edge_style = 'neon'
vim.g.colors_name='edge'

vim.g.lightline = {
  colorscheme= 'edge',
  active= {
    left= { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } ,
  },
  component_function = {
    gitbranch = 'gitbranch#name'
  },
}
vim.g.blamer_relative_time = 1
vim.g.blamer_delay = 200
vim.g.blamer_enabled = 1
vim.g.nvim_tree_width = 35
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_hide_dotfiles = 0

-- prettier
vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.md,*.mdx,*.svelte,*.yml,*yaml :Prettier]]

vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1

require("keybindings_setup")
