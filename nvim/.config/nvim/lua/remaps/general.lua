map = vim.keymap.set
opt = { noremap = true, silent = true }


vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})






-- to remove annoying space
map("n", " ", "<Nop>", opt)

-- unhighlighting
map("n", "Y", ":noh<CR>", opt)


map("i", "<C-BS>", "<C-w>", opt)
map("i", "<C-H>", "<C-w>", opt)
map("i", "<C-w>", "<Nop>", opt)






map("n", "h", "gc", opt)
-- map("n", "hh", "gcc", opt)

map("v", "h", "gc", opt)
map("x", "h", "gc", opt)


vim.keymap.set("", "<ScrollWheelUp>", "<C-Y>", { noremap = true, silent = true })
vim.keymap.set("", "<ScrollWheelDown>", "<C-E>", { noremap = true, silent = true })


-- the below is for smart tab
-- auto indents when going into insert mode if line is empty
-- map("n", "i", function()
--   return string.match(vim.api.nvim_get_current_line(), '%g') == nil and 'cc' or 'i'
-- end, { expr = true, noremap = true })

-- map("n", "<C-i>", "i", opt)

-- this maps tab in insert mode so that if it indents automatically to the correct level only
-- if the line is empty
-- map("i", "<Tab>", function()
--   return string.match(vim.api.nvim_get_current_line(), '%g') == nil and '<Esc>cc' or '<Tab>'
-- end, { expr = true, noremap = true })






local _, hls, names, funcs = my_hls()
local set_hl = funcs.set_hl


map("n", "r", function()
   vim.api.nvim_feedkeys("r", "n", false)
   set_hl(names.replace, hls.single_replace)

   _G.single_replace = true
   vim.schedule(function() vim.cmd("doautocmd ModeChanged") end)
end, {})





