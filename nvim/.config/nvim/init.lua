vim.api.nvim_create_autocmd("ColorScheme", {
   callback = function()
      vim.cmd [[
      highlight Normal guibg=None
      highlight NormalNC guibg=None
      highlight Comment guibg=None
      highlight StatusLine guibg=None
      ]]
   end
})



require("utils")
require("vim-options")


require("start-lazy")


require("fold")



-- run remaps
run_all_with_start("remaps", "general")





