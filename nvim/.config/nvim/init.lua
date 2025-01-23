vim.api.nvim_create_autocmd("ColorScheme", {
   callback = function()
      vim.cmd [[
      highlight Normal guibg=None
      highlight NormalNC guibg=None
      highlight Comment guibg=None
      highlight StatusLine guibg=None

      set guicursor=n:block-c_normal,i-c:ver15-c_insert,v:block-c_visual,o:block-c_operator,r:hor30-c_replace
      ]]
   end
})


local set_hl = function(grp, hl)
   vim.api.nvim_set_hl(0, grp, hl)
end


local normal = { fg = "#ff0000", bg = "#00ff4a" } -- light green
local insert = { fg = "#ffffff", bg = "#ff0099" } -- pink

local visual = { fg = "#ffffff", bg = "#9e00ff" }  -- purple
local line = { fg = "#ffffff", bg = "#00dbff" }  -- light blue
local block = { fg = "#ffffff", bg = "#0020ff" }  -- blue

local operator = { fg = "#ffffff", bg = "#ffc600" } -- orange
local replace = { fg = "#ffffff", bg = "#ff0000" }  -- red 


set_hl("c_normal", normal)
set_hl("c_insert", insert)
set_hl("c_visual", visual)
set_hl("c_operator", operator)
set_hl("c_replace", replace)



vim.api.nvim_create_autocmd("ModeChanged", {
   callback = function()
      local mode = vim.fn.mode(1)
      if mode == "v" then
         set_hl("c_visual", visual)
      elseif mode == "V" then
         set_hl("c_visual", line)
      else
         set_hl("c_visual", block)
      end
   end
})



require("utils")
require("vim-options")


require("start-lazy")


require("fold")



-- run remaps
run_all_with_start("remaps", "general")
