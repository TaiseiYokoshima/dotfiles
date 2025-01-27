map = vim.keymap.set
opt = { noremap = true, silent = true }
-- | panes
-- map("n", "<leader>k", "<C-w>h", opt)

map("n", "<C-=>", ":vertical resize +1<CR>", opt)
map("n", "<C-->", ":vertical resize -1<CR>", opt)
map("n", "<leader>s", ":vsplit<CR>", opt)




_G.my_move = function(direction)
   if direction == "left" then
      direction = "h"
   elseif direction == "right" then
      direction = "l"
   elseif direction == "down" then
      direction = "j"
   else
      direction = "k"
   end


   local id = vim.api.nvim_get_current_win()
   vim.cmd("wincmd " .. direction)
   local after = vim.api.nvim_get_current_win()

   local result = after == id

   if result then
      vim.cmd("echom 'stayed'")
   else


      vim.cmd("echom 'moved'")
   end


end





map("n", "<S-Left>", "<C-w>h", opt)
map("n", "<S-Right>", "<C-w>l", opt)
map("n", "<S-Up>", "<C-w>k", opt)
map("n", "<S-Down>", "<C-w>j", opt)
