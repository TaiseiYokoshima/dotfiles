vim.api.nvim_create_autocmd("ColorScheme", {
   callback = function()
      vim.cmd [[
      highlight Normal guibg=None
      highlight NormalNC guibg=None
      highlight Comment guibg=None
      highlight StatusLine guibg=None

      set guicursor=n:block-c_normal,i-c-ci:ver15-c_insert,v:block-c_visual,o:block-c_operator,r:hor30-c_replace
      ]]

      vim_do("set_hl")
   end
})




local _, hls, names, funcs = my_hls()
local set_hl = funcs.set_hl



vim.api.nvim_create_autocmd("ModeChanged", {
   callback = function()
      if _G.single_replace == true then
         vim.schedule(function() vim.cmd("doautocmd User SingleReplace") end)
      end

      local mode = vim.fn.mode(1)
      if mode == "v" then
         set_hl(names.visual, hls.visual)
      elseif mode == "V" then
         set_hl(names.visual, hls.line)
      else
         set_hl(names.visual, hls.block)
      end
   end
})


vim.api.nvim_create_autocmd("User", {
   pattern = "SingleReplace",
   callback = function()
      _G.single_replace = false
      vim.schedule(function() set_hl("c_replace", hls.replace) end)
   end
})




