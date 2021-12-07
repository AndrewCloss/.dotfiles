-- nvim-telescope/telescope.nvim
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  -- pickers = {
    -- find_files = {
    --   hidden = true
    -- },
    -- live_grep = {
    --   hidden = true
    -- }
  -- },
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}
