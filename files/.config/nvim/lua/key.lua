vim.api.nvim_set_keymap('n', '<C-M-n>', ':NERDTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeFocus<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-t>', ':TagbarToggle<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true });
vim.api.nvim_set_keymap('n', '<M-t>', ':tabclose<CR>', { noremap = true });
vim.api.nvim_set_keymap('n', '<C-d>', ':tab split<CR> <C-]>', {});

vim.api.nvim_set_keymap('n', '<M-Right>', ':tabnext<CR>', { noremap = true });
vim.api.nvim_set_keymap('n', '<M-Left>', ':tabprevious<CR>', { noremap = true });

vim.api.nvim_set_keymap('n', '<C-x>', ':terminal<CR>i', { noremap = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-Q>', ':qa<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-Right>', ':vertical resize +1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-Left>', ':vertical resize -1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-Up>', ':resize -1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-Down>', ':resize +1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-=>', '<C-w>=', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-s>', ':vsplit<CR>', { noremap = true })
