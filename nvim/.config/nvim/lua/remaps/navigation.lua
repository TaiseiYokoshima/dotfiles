map = vim.keymap.set
opt = { noremap = true, silent = true }

-- | navigatoinal
-- moves the selected text up and down

map("x", "<Down>", ":m '>+1<CR><CR>gv=gv", opt)
map("x", "<Up>", ":m '<-2<CR><CR>gv=gv", opt)

map("n", "<Down>", ":m +1<CR>", opt)
map("n", "<Up>", ":m -2<CR>", opt)

-- moves to next and previous search hit but keeps the cursor in the middle of the page 
map("n", "n" , "nzzzv", opt)
map("n", "N" , "Nzzzv", opt)


-- jumping places back and forth
map("n", "<leader>o", "<C-o>", opt)
map("n",  "<leader>i", "<C-i>", opt)

-- to go up and down half page but keeps the cursor in the middle of the page
map("n", "<C-Left>", "<C-u>zz", opt)
map("n", "<C-Right>", "<C-d>zz", opt)



-- since ; is used for arrows
map("n", ".", ";", opt)
