map = vim.keymap.set
opt = { noremap = true, silent = true }
-- | panes
-- map("n", "<leader>k", "<C-w>h", opt)

map("n", "<C-=>", ":vertical resize +1<CR>", opt)
map("n", "<C-->", ":vertical resize -1<CR>", opt)
map("n", "<leader>s", ":vsplit<CR>", opt)



map("n", "<S-Left>", "<C-w>h", opt)
map("n", "<S-Right>", "<C-w>l", opt)
map("n", "<S-Up>", "<C-w>k", opt)
map("n", "<S-Down>", "<C-w>j", opt)

