vim.fn.setenv("nvim", "1")


_G.my_move = function(direction)
   local old = direction
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
   vim.cmd("silent wincmd " .. direction)
   local after = vim.api.nvim_get_current_win()

   local result = after == id
   if result then
      vim.cmd("silent! ! zellij action move-focus " .. old)
      vim.cmd("silent! redrawstatus")
   end
end

local move_left = function()
   _G.my_move("left")
end

local move_right = function()
   _G.my_move("right")
end


local move_up = function()
   _G.my_move("up")
end


local move_down = function()
   _G.my_move("down")
end



map("n", "<S-Left>", move_left, opt)
map("n", "<S-Right>", move_right, opt)
map("n", "<S-Up>", move_up, opt)
map("n", "<S-Down>", move_down, opt)




vim.api.nvim_create_autocmd({ "FocusGained", "VimEnter" }, {
   pattern = "*",
   callback = function()
      vim.cmd("silent! ! zellij action switch-mode locked")
      vim.cmd("silent! redrawstatus")
   end,
})



vim.api.nvim_create_autocmd("FocusLost", {
   callback = function()
      vim.cmd("silent! ! zellij action switch-mode normal")
   end,
})


vim.api.nvim_create_autocmd("VimLeave", {
   callback = function()
      vim.cmd("silent! ! zellij action switch-mode normal")
   end,
})
