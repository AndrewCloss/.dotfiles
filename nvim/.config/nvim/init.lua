require('misc') -- feline.nvim requires termguicolors
require('config')
require('mappings')

-- Mappings require a plugin, delay load until plugins installed
-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) == 0 then
  -- require('mappings')
-- end
