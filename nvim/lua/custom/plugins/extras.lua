return {
  {
    'fladson/vim-kitty',
  },
  {
    'editorconfig/editorconfig-vim',
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = {},
  },
  -- Neovim plugin to improve the default vim.ui interfaces
  {
    'stevearc/dressing.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
    config = function()
      require('dressing').setup()
    end,
  },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    config = function()
      require('barbecue').setup {
        create_autocmd = false, -- prevent barbecue from updating itself automatically
      }

      vim.api.nvim_create_autocmd({
        'WinScrolled', -- or WinResized on NVIM-v0.9 and higher
        'BufWinEnter',
        'CursorHold',
        'InsertLeave',

        -- include this if you have set `show_modified` to `true`
        -- "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup('barbecue.updater', {}),
        callback = function()
          require('barbecue.ui').update()
        end,
      })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function()
      require('bufferline').setup()
    end,
    keys = {
      { '`', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next tab' },
      { '~', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Prev tab' },
      { 'bp', '<Cmd>BufferLinePick<CR>', desc = 'Bufferline Pick' },
    },
  },
  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    'danymat/neogen',
    keys = {
      {
        '<leader>cc',
        function()
          require('neogen').generate {}
        end,
        desc = 'Neogen Comment',
      },
    },
    opts = { snippet_engine = 'luasnip' },
  },

  -- Incremental rename
  {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    config = true,
  },

  -- Refactoring tool
  {
    'ThePrimeagen/refactoring.nvim',
    keys = {
      {
        '<leader>rr',
        function()
          require('refactoring').select_refactor()
        end,
        mode = 'v',
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.keymap.set(
        'n',
        '<leader>tt',
        '<cmd>:FloatermNew --height=0.7 --width=0.8 --wintype=float --name=floaterm1 --position=center --autoclose=2<CR>',
        { desc = 'Open FloatTerm' }
      )
      vim.keymap.set('n', '<leader>tft', '<cmd>:FloatermToggle<CR>', { desc = 'Toggle FloatTerm' })
      vim.keymap.set('t', '<leader>fq', '<cmd>:FloatermToggle<CR>', { desc = 'Toggle FloatTerm' })
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  -- filename
  -- {
  --   'b0o/incline.nvim',
  --   dependencies = { 'craftzdog/solarized-osaka.nvim' },
  --   event = 'BufReadPre',
  --   priority = 1200,
  --   config = function()
  --     local colors = require('solarized-osaka.colors').setup()
  --     require('incline').setup {
  --       highlight = {
  --         groups = {
  --           InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
  --           InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
  --         },
  --       },
  --       window = { margin = { vertical = 0, horizontal = 1 } },
  --       hide = {
  --         cursorline = true,
  --       },
  --       render = function(props)
  --         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
  --         if vim.bo[props.buf].modified then
  --           filename = '[+] ' .. filename
  --         end
  --
  --         local icon, color = require('nvim-web-devicons').get_icon_color(filename)
  --         return { { icon, guifg = color }, { ' ' }, { filename } }
  --       end,
  --     }
  --   end,
  -- },
}
