-- Dismiss Noice Message
vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice Message' })

-- close buffer
vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>', { desc = 'Close Buffer' })

-- Close buffer without closing split
vim.keymap.set('n', '<leader>wq', '<cmd>bp|bd #<CR>', { desc = 'Close Buffer; Retain Split' })

vim.keymap.set('n', '<leader>ngs', '<cmd>Neotree git_status<CR>', { desc = 'Git status' })

-- Resize with arrows
vim.keymap.set('n', '<C-S-Down>', ':resize +2<CR>', { desc = 'Resize Horizontal Split Down' })
vim.keymap.set('n', '<C-S-Up>', ':resize -2<CR>', { desc = 'Resize Horizontal Split Up' })

-- My custom keymaps
vim.keymap.set('n', '<leader>lr', ':set invrelativenumber<CR>', { desc = 'Toggle relative number' })

vim.keymap.set('n', '<leader>rn', function()
  return ':IncRename ' .. vim.fn.expand '<cword>'
end, { expr = true })

vim.keymap.set('i', '<C-e>', '<esc>A')
vim.keymap.set('i', '<C-a>', '<esc>I')
