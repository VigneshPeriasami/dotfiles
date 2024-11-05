-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree toggle float<CR>:set relativenumber<CR>', silent = true, desc = 'Float File Explorer' },
    { '<leader><Tab>', ':Neotree toggle left<CR>', silent = true, desc = 'Left File Explorer' },
  },
  opts = {
    event_handlers = {
      event = 'neo_tree_buffer_enter',
      handler = function()
        vim.opt_local.relativenumber = true
      end,
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      filtered_items = {
        visible = true,
        hide_dot_files = false,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['/'] = 'noop',
        },
      },
      buffers = { follow_current_file = { enable = true } },
    },
    git_status = {
      window = {
        position = 'float',
      },
    },
  },
}
