require("utils")
require("vim-options")

vim_do("autocmds")

require("start-lazy")


require("fold")


-- run remaps
run_all_with_start("remaps", "general")
