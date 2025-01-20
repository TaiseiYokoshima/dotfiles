map = vim.keymap.set
opt = { noremap = true, silent = true }

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
