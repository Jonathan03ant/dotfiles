require 'core.options'
require 'core.keymaps'

-- Installing Lazy.vim plugin manager
-- :Lazy for UI inside nvim

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)



-- Installing a treesitter and neo-tree to better mage files in a file manager structures
-- dependencies will also be installed
require('lazy').setup({
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },

    require 'plugins.themes.onedark',
    require 'plugins.neotree',
})

