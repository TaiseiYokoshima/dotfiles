require("utils")
require("vim-options")

vim_do("autocmds")

require("start-lazy")


require("fold")


-- run remaps
run_all_with_start("remaps", "general")


in_zellij = not (vim.fn.getenv("ZELLIJ") == vim.NIL)
-- in_zellij = false

if in_zellij then
   vim_do("zellij")
end
