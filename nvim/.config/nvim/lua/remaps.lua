local map = vim.keymap.set
local opt = { noremap = true, silent = true }



-- | uncategorized
--
--
map("n",  " ", "Nop", opt)

-- unhighlighting
map("n",  "Y", ":noh<CR>", opt)

-- since ; is used for arrows
map("n", ".", ";", opt)


-- auto indents when going into insert mode if line is empty
map("n", "i", function()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil and 'cc' or 'i'
end, { expr = true, noremap = true })

map("n", "<C-i>", "i", opt)

-- this maps tab in insert mode so that if it indents automatically to the correct level only 
-- if the line is empty
map("i", "<Tab>", function()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil and '<Esc>cc' or '<Tab>'
end, { expr = true, noremap = true })



-- | luasnips
local ls = require("luasnip")
-- map({"i", "s"}, "<S-Left>", function() might work better?
map("i", "<S-Left>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)

map("i", "<S-Right>", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end)


-- | navigatoinal
-- moves the selected text up and down
map("x", "<S-Down>", ":m '>+1<CR>gv=gv", opt)
map("x", "<S-Up>", ":m '<-2<CR>gv=gv", opt)

-- moves to next and previous search hit but keeps the cursor in the middle of the page 
map("n", "n" , "nzzzv", opt)
map("n", "N" , "Nzzzv", opt)


-- jumping places back and forth
map("n", "<leader>o", "<C-o>", opt)
map("n",  "<leader>i", "<C-i>", opt)

-- to go up and down half page but keeps the cursor in the middle of the page
map("n", "<C-Left>", "<C-u>zz", opt)
map("n", "<C-Right>", "<C-d>zz", opt)


-- | panes
map("n", "<leader>k", "<C-w>h", opt)
map("n", "<leader>l", "<C-w>l", opt)
map("n", "<leader>j", "<C-w>k", opt)
map("n", "<leader>;", "<C-w>j", opt)
map("n", "<C-=>", ":vertical resize +1<CR>", opt)
map("n", "<C-->", ":vertical resize -1<CR>", opt)
map("n", "<leader>s", ":vsplit<CR>", opt)





-- motion keys
-- resets up motion
map("n", "j", "k", opt)
-- resets down motion
map("n", ";", "j", opt)
-- resets left motion
map("n", "k", "h", opt)


-- resets up motion
map("v", "j", "k", opt)
-- resets down motion
map("v", ";", "j", opt)
-- resets left motion
map("v", "k", "h", opt)

-- resets up motion
map("x", "j", "k", opt)
-- resets down motion
map("x", ";", "j", opt)
-- resets left motion
map("x", "k", "h", opt)


map("o", "j", "k", opt)
-- resets down motion
map("o", ";", "j", opt)
-- resets left motion
map("o", "k", "h", opt)


map("s", "j", "k", opt)
-- resets down motion
map("s", ";", "j", opt)
-- resets left motion
map("s", "k", "h", opt)










-- | yanking, clipboard


-- custom show yanked 
function _G.show_registers()
  local default = vim.fn.getreg('"')
  local clipboard = vim.fn.getreg('+')

  local default_str = "yank: " .. default
  local clipboard_str = "clipboard: " .. clipboard

  print(default_str)
  print(clipboard_str)
end

map("n", "<C-h>", ":lua _G.show_registers()<CR>")



local yank_clipboard_only = function (cmd)
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










-- | yank register  

-- remaps so that deleting will not change yank register
map("n", "x", '"_x', opt)          -- replacing one char

map("n", "d", '"_d', opt)          -- deleting
map("v", "d", '"_d', opt)          --    |
map("x", "d", '"_d', opt)          --    |

map("n", "D", '"_D', opt)          -- delete entire line


map("v", "p", '"_dp', opt)         -- pasting in v or x
map("x", "p", '"_dp', opt)         --     | 

map("v", "P", '"_dP', opt)         -- pasting before in v or x
map("x", "P", '"_dP', opt)         --     |


map("n", "<leader>x", 'x', opt)   -- the normals is set to use with leader
                                                                           --       |
map("n", "<leader>d", 'd', opt)   --       |
map("v", "<leader>d", 'd', opt)   --       |
map("x", "<leader>d", 'd', opt)   --       |
                                                                           --       |
map("n", "<leader>D", 'D', opt)   --       |
                                                                           --       |
map("v", "<leader>p", 'p', opt)   --       |
map("x", "<leader>p", 'p', opt)   --       |
                                                                           --       |
map("v", "<leader>P", 'P', opt)   --       |
map("x", "<leader>P", 'P', opt)   --       |


map("n", "s", '"_s', opt)
map("v", "s", '"_s', opt)
map("x", "s", '"_s', opt)
