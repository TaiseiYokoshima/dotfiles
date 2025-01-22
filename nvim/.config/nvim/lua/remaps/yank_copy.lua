map = vim.keymap.set
opt = { noremap = true, silent = true }

-- custom show yanked
function _G.show_registers()
   local default = vim.fn.getreg('"')
   local clipboard = vim.fn.getreg('+')

   local default_str = "yank: " .. default
   local clipboard_str = "clipboard: " .. clipboard

   print(clipboard_str)
   print(default_str)
end

map("n", "<C-h>", ":lua _G.show_registers()<CR>")



local yank_clipboard_only = function(cmd)
   local saved_register = vim.fn.getreg('"')
   local saved_register_type = vim.fn.getregtype('"')
   vim.api.nvim_command(cmd)
   vim.fn.setreg('"', saved_register, saved_register_type)
end

-- system clipboard
-- pastes without changing what's in the yanked buffer
map('n', '<leader>cc', function() yank_clipboard_only('normal! "+yy') end, opt)
map('v', '<leader>c', function() yank_clipboard_only('normal! "+y') end, opt)
map('x', '<leader>c', function() yank_clipboard_only('normal! "+y') end, opt)

map("n", "<leader>v", '"+p', opt)
map("x", "<leader>v", '"_d"+p', opt)
map("v", "<leader>v", '"_d"+p', opt)

map("n", "<leader>V", '"+P', opt)
map("x", "<leader>V", '"_d"+P', opt)
map("v", "<leader>V", '"_d"+P', opt)

map("n", "<C-x><C-x>", '"+yy"_dd', opt)
map("x", "<C-x>", '"+y"_dd', opt)
map("v", "<C-x>", '"+y"_dd', opt)


map("v", "p", '"_dp', opt)
map("x", "p", '"_dp', opt)

map("v", "P", '"_dP', opt)
map("x", "P", '"_dP', opt)


map("v", "<leader>p", 'p', opt)
map("x", "<leader>p", 'p', opt)

map("v", "<leader>P", 'P', opt)
map("x", "<leader>P", 'P', opt)


-- map("i", "<C-S-p>", '<C-r>"', opt)
