




vim.api.nvim_create_autocmd("ColorScheme", {
   callback = function()
      vim.cmd [[
      highlight Normal guibg=None
      highlight NormalNC guibg=None
      highlight Comment guibg=None
      highlight StatusLine guibg=None

      set guicursor=n:block-c_normal,i-c-ci:ver15-c_insert,v:block-c_visual,o:block-c_operator,r:hor30-c_replace
      ]]
   end
})

local highlights = require("highlights")

local set_hl = highlights.set_hl
local c_visual = highlights.c_visual
local c_line = highlights.c_line
local c_block = highlights.c_block


vim.api.nvim_create_autocmd("ModeChanged", {
   callback = function()
      if _G.single_replace == true then
         vim.schedule(function() vim.cmd("doautocmd User SingleReplace") end)
      end

      local mode = vim.fn.mode(1)
      if mode == "v" then
         set_hl("c_visual", c_visual)
      elseif mode == "V" then
         set_hl("c_visual", c_line)
      else
         set_hl("c_visual", c_block)
      end
   end
})


vim.api.nvim_create_autocmd("User", {
   pattern = "SingleReplace",
   callback = function()
      _G.single_replace = false
      vim.schedule( function () highlights.set_hl("c_replace", highlights.c_replace) end)
   end
})


_G.treesitter_highlighter_active = function()
   print(vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()])
end

require("utils")
require("vim-options")


require("start-lazy")


require("fold")



-- run remaps
run_all_with_start("remaps", "general")



-- local original = vim.cmd

-- vim.cmd = function(cmd)
--    original("redir => result")
--    original(cmd)
--    original("redir END")
--    original("echom result")
-- end

-- vim.api.nvim_create_autocmd("CmdlineChanged", {
--    callback = function ()
--       vim.cmd("redrawstatus")
--    end
--
-- })
