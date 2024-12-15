vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-k>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Normal mode
vim.api.nvim_set_keymap('n', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })

-- Visual mode
vim.api.nvim_set_keymap('v', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true, silent = true })

-- Insert mode
vim.api.nvim_set_keymap('i', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'k', 'j', { noremap = true, silent = true })

-- Command-line mode
vim.api.nvim_set_keymap('c', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', 'k', 'j', { noremap = true, silent = true })

vim.wo.number = true
